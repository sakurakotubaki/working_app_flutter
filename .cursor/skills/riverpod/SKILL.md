---
name: riverpod
description: >-
  Applies Riverpod patterns for Flutter/Dart state management: ProviderScope,
  codegen and manual providers, ref.watch/read/listen rules, families,
  autoDispose lifecycle, side effects with AsyncValue, observers, and testing
  with ProviderContainer/overrides. Use when setting up providers, combining
  async state, Notifiers, passing parameters, testing, or applying Riverpod
  best practices.
---

# Riverpod

Guidance for correct Riverpod usage in Flutter and Dart. Based on [evanca/flutter-ai-rules — riverpod](https://github.com/evanca/flutter-ai-rules/blob/main/skills/riverpod/SKILL.md) and the [Riverpod repository](https://github.com/rrousselGit/riverpod).

---

## 1. Setup

```dart
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
```

- Wrap the app with `ProviderScope` directly in `runApp` — not inside `MyApp`.
- Prefer `riverpod_lint` for refactors and best-practice enforcement.

---

## 2. Defining providers

```dart
// Functional provider (codegen)
@riverpod
int example(Ref ref) => 0;

// FutureProvider (codegen)
@riverpod
Future<List<Todo>> todos(Ref ref) async {
  return ref.watch(repositoryProvider).fetchTodos();
}

// Notifier (codegen)
@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  Future<List<Todo>> build() async {
    return ref.watch(repositoryProvider).fetchTodos();
  }

  Future<void> addTodo(Todo todo) async { /* ... */ }
}
```

- Define providers as **`final` top-level** symbols.
- Pick `Provider`, `FutureProvider`, or `StreamProvider` by return type; use `Notifier` / `AsyncNotifier` when mutable state is needed.
- In widgets that read providers, use **`ConsumerWidget` or `ConsumerStatefulWidget`**, not plain `StatelessWidget` / `StatefulWidget`.

---

## 3. Using `Ref`

| Method | Use for |
|--------|---------|
| `ref.watch` | Reactive reads — **only during build** (rebuilds when the value changes). |
| `ref.read` | One-shot reads — **callbacks, listeners, Notifier methods** — not in build. |
| `ref.listen` | Imperative reactions to changes — prefer `watch` when a rebuild is enough. |
| `ref.onDispose` | Cleanup when provider state is disposed. |

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(myProvider);
    return Text('$value');
  }
}

final provider = StreamProvider<int>((ref) {
  final controller = StreamController<int>();
  ref.onDispose(controller.close);
  return controller.stream;
});
```

- **Do not** call `ref.watch` inside callbacks, listeners, or Notifier methods.
- Call Notifier APIs with `ref.read(yourNotifierProvider.notifier).method()`.
- After `await` in async UI code, check `context.mounted` before using `context` / `ref` if the widget may unmount.

---

## 4. Combining providers

```dart
@riverpod
Future<String> userGreeting(Ref ref) async {
  final user = await ref.watch(userProvider.future);
  return 'Hello, ${user.name}!';
}
```

- Use `ref.watch(asyncProvider.future)` to await an async provider’s resolved value.
- Providers cache: multiple listeners share one computation.

---

## 5. Families (parameters)

```dart
@riverpod
Future<Todo> todo(Ref ref, String id) async {
  return ref.watch(repositoryProvider).fetchTodo(id);
}

// Usage
final todo = ref.watch(todoProvider('some-id'));
```

- Prefer **`autoDispose` for parameterized providers** to avoid leaks (codegen defaults toward auto-dispose; manual providers often need `.family` + `.autoDispose`).
- For multiple parameters, use **Dart 3 records** or codegen — good value equality.
- Avoid plain `List` / `Map` as family keys unless equality is stable (e.g. `const` collections, records, or types with proper `==`).
- Enable `provider_parameters` from `riverpod_lint` where applicable.

---

## 6. Auto dispose and lifecycle

- **Codegen:** state is typically **disposed when unused** unless `keepAlive: true`.
- **Manual:** state is **kept alive by default** — use `.autoDispose` when disposal is desired.
- Recomputing a provider destroys its previous state.

```dart
ref.onCancel(() {
  final link = ref.keepAlive();
  Timer(const Duration(minutes: 5), link.close);
});
```

- Use `ref.onDispose` for cleanup; **avoid** side effects that modify other providers from inside `onDispose`.
- `ref.invalidate(provider)` — drop cached state; `ref.invalidateSelf()` from inside the provider.
- `ref.refresh(provider)` — invalidate and **immediately read** the new value; **use the return value**.

---

## 7. Eager initialization

Providers are lazy. To start work early:

```dart
Consumer(
  builder: (context, ref, _) {
    ref.watch(myEagerProvider);
    return const MyApp();
  },
)
```

- Prefer a **public widget under `ProviderScope`** over `main()` so tests stay predictable.
- `AsyncValue.requireValue` throws clearly if data is not ready.

---

## 8. Side effects

```dart
@riverpod
class TodosNotifier extends _$TodosNotifier {
  Future<void> addTodo(Todo todo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(repositoryProvider).addTodo(todo);
      return [...?state.value, todo];
    });
  }
}

// UI
ElevatedButton(
  onPressed: () => ref.read(todosNotifierProvider.notifier).addTodo(todo),
  child: const Text('Add'),
)
```

- Use **`ref.read`** in event handlers, not `watch`.
- After effects: assign state, `invalidateSelf()`, or update caches explicitly.
- Handle **loading and error** in UI.
- Avoid side effects in provider constructors / `build` of Notifiers.

---

## 9. Provider observers

```dart
class MyObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    // log or analytics
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    // report to crash/error service
  }
}

runApp(ProviderScope(observers: [MyObserver()], child: MyApp()));
```

---

## 10. Testing

```dart
final container = ProviderContainer(
  overrides: [repositoryProvider.overrideWith((_) => FakeRepository())],
);
addTearDown(container.dispose);

expect(await container.read(todosProvider.future), isNotEmpty);
```

```dart
await tester.pumpWidget(
  ProviderScope(
    overrides: [repositoryProvider.overrideWith((_) => FakeRepository())],
    child: const MyApp(),
  ),
);
```

- **New** `ProviderContainer` or `ProviderScope` per test — no shared state.
- For `autoDispose` providers, `container.listen` can keep state alive during the test.
- **Override dependencies** (e.g. repositories), not Notifiers, when possible.
- If mocking a Notifier, **subclass** the real Notifier — avoid `implements` or `Mock` that breaks generated code.
- In widget tests: `ProviderScope.containerOf(tester.element(...))` when you need the container.

---

## References

- [Riverpod (GitHub)](https://github.com/rrousselGit/riverpod)
- [Upstream skill source](https://github.com/evanca/flutter-ai-rules/blob/main/skills/riverpod/SKILL.md)
