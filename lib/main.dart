import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:working_app_flutter/app/provider_retry.dart';
import 'package:working_app_flutter/app/providers/shared_preferences_provider.dart';
import 'package:working_app_flutter/app/router/app_router.dart';

final appRouter = AppRouter();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      retry: globalProviderRetry,
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: MainApp(appRouter: appRouter),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
