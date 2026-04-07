// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the user has finished onboarding (persisted).
///
/// [keepAlive] avoids [UnmountedRefException] when [complete] awaits: autoDispose
/// would dispose the notifier mid-async because nothing subscribes across the gap.

@ProviderFor(Onboarding)
final onboardingProvider = OnboardingProvider._();

/// Whether the user has finished onboarding (persisted).
///
/// [keepAlive] avoids [UnmountedRefException] when [complete] awaits: autoDispose
/// would dispose the notifier mid-async because nothing subscribes across the gap.
final class OnboardingProvider extends $NotifierProvider<Onboarding, bool> {
  /// Whether the user has finished onboarding (persisted).
  ///
  /// [keepAlive] avoids [UnmountedRefException] when [complete] awaits: autoDispose
  /// would dispose the notifier mid-async because nothing subscribes across the gap.
  OnboardingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingHash();

  @$internal
  @override
  Onboarding create() => Onboarding();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$onboardingHash() => r'abc87a881d610a0293afcd919c626add906dbc0e';

/// Whether the user has finished onboarding (persisted).
///
/// [keepAlive] avoids [UnmountedRefException] when [complete] awaits: autoDispose
/// would dispose the notifier mid-async because nothing subscribes across the gap.

abstract class _$Onboarding extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
