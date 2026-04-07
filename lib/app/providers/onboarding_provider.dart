import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:working_app_flutter/app/onboarding_keys.dart';
import 'package:working_app_flutter/app/providers/shared_preferences_provider.dart';

part 'onboarding_provider.g.dart';

/// Whether the user has finished onboarding (persisted).
///
/// [keepAlive] avoids [UnmountedRefException] when [complete] awaits: autoDispose
/// would dispose the notifier mid-async because nothing subscribes across the gap.
@Riverpod(keepAlive: true)
class Onboarding extends _$Onboarding {
  @override
  bool build() {
    return ref.read(sharedPreferencesProvider).getBool(OnboardingKeys.completed) ??
        false;
  }

  Future<void> complete() async {
    await ref.read(sharedPreferencesProvider).setBool(OnboardingKeys.completed, true);
    if (!ref.mounted) return;
    state = true;
  }
}
