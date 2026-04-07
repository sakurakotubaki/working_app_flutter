---
name: testing
description: >-
  Guides writing and reviewing Flutter/Dart tests: regression-focused validity,
  group structure named after the class under test, and "should" naming for
  expected behavior. Use when adding or editing unit tests, widget tests,
  integration tests, or when reviewing test quality, mocks, and naming.
---

# Flutter / Dart テスト

意味のあるテストを書く・レビューするための指針。出典: [evanca/flutter-ai-rules — testing](https://github.com/evanca/flutter-ai-rules/blob/main/skills/testing/SKILL.md)。

---

## 1. テストの妥当性

テストを書く・受け入れる前に次を問う:

> **「本番コードが壊れていれば、このテストは本当に失敗するか？」**

- モックやフェイクだけを確認し、実ロジックを反映していないテストは避ける。
- 言語・標準ライブラリや自明なコードが保証していることだけを検証するテストは避ける。
- 各テストは **実際のリグレッションを検知できる** ようにする。

---

## 2. 構造

テストファイルでは **常に `group()` を使う** — テストが1つだけでも。グループ名は **テスト対象のクラス名** に合わせる:

```dart
group('Counter', () {
  test('value should start at 0', () {
    final counter = Counter();
    expect(counter.value, 0);
  });
});
```

---

## 3. 命名

期待する振る舞いが分かるように、ケース名に **"should"** を使う:

```dart
test('should emit updated list when item is added', () { ... });
test('should throw ArgumentError when input is negative', () { ... });
```

---

## 参照

- [Upstream skill (GitHub)](https://github.com/evanca/flutter-ai-rules/blob/main/skills/testing/SKILL.md)
