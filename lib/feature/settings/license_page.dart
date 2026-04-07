import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:working_app_flutter/app/providers/license_provider.dart';

@RoutePage()
class AppLicensesPage extends HookConsumerWidget {
  const AppLicensesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(applicationLicenseNameProvider);
    final version = ref.watch(applicationLicenseVersionProvider);
    return LicensePage(
      applicationName: name,
      applicationVersion: version,
    );
  }
}
