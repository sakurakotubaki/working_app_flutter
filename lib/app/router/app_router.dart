import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:working_app_flutter/feature/bootstrap/bootstrap_page.dart';
import 'package:working_app_flutter/feature/onboarding/onboarding_page.dart';
import 'package:working_app_flutter/feature/park/park_details.dart';
import 'package:working_app_flutter/feature/park/park_details_transition.dart';
import 'package:working_app_flutter/feature/park/park_page.dart';
import 'package:working_app_flutter/feature/park/park_tab_page.dart';
import 'package:working_app_flutter/feature/settings/license_page.dart';
import 'package:working_app_flutter/feature/settings/settings_page.dart';
import 'package:working_app_flutter/feature/settings/settings_tab_page.dart';
import 'package:working_app_flutter/feature/shell/main_shell_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BootstrapRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page, path: '/onboarding'),
        AutoRoute(
          page: MainShellRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: ParkTabRoute.page,
              path: 'park',
              children: [
                AutoRoute(page: ParkRoute.page, path: ''),
                CustomRoute(
                  page: ParkDetailsRoute.page,
                  path: 'details',
                  duration: const Duration(milliseconds: 450),
                  reverseDuration: const Duration(milliseconds: 400),
                  transitionsBuilder: parkDetailsTransitionsBuilder,
                ),
              ],
            ),
            AutoRoute(
              page: SettingsTabRoute.page,
              path: 'settings',
              children: [
                AutoRoute(page: SettingsRoute.page, path: ''),
                AutoRoute(page: AppLicensesRoute.page, path: 'license'),
              ],
            ),
          ],
        ),
      ];
}
