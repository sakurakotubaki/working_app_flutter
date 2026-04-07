// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppLicensesPage]
class AppLicensesRoute extends PageRouteInfo<void> {
  const AppLicensesRoute({List<PageRouteInfo>? children})
    : super(AppLicensesRoute.name, initialChildren: children);

  static const String name = 'AppLicensesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppLicensesPage();
    },
  );
}

/// generated route for
/// [BootstrapPage]
class BootstrapRoute extends PageRouteInfo<void> {
  const BootstrapRoute({List<PageRouteInfo>? children})
    : super(BootstrapRoute.name, initialChildren: children);

  static const String name = 'BootstrapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BootstrapPage();
    },
  );
}

/// generated route for
/// [MainShellPage]
class MainShellRoute extends PageRouteInfo<void> {
  const MainShellRoute({List<PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainShellPage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [ParkDetailsPage]
class ParkDetailsRoute extends PageRouteInfo<ParkDetailsRouteArgs> {
  ParkDetailsRoute({
    Key? key,
    required String imageAsset,
    List<PageRouteInfo>? children,
  }) : super(
         ParkDetailsRoute.name,
         args: ParkDetailsRouteArgs(key: key, imageAsset: imageAsset),
         initialChildren: children,
       );

  static const String name = 'ParkDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ParkDetailsRouteArgs>();
      return ParkDetailsPage(key: args.key, imageAsset: args.imageAsset);
    },
  );
}

class ParkDetailsRouteArgs {
  const ParkDetailsRouteArgs({this.key, required this.imageAsset});

  final Key? key;

  final String imageAsset;

  @override
  String toString() {
    return 'ParkDetailsRouteArgs{key: $key, imageAsset: $imageAsset}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ParkDetailsRouteArgs) return false;
    return key == other.key && imageAsset == other.imageAsset;
  }

  @override
  int get hashCode => key.hashCode ^ imageAsset.hashCode;
}

/// generated route for
/// [ParkPage]
class ParkRoute extends PageRouteInfo<void> {
  const ParkRoute({List<PageRouteInfo>? children})
    : super(ParkRoute.name, initialChildren: children);

  static const String name = 'ParkRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ParkPage();
    },
  );
}

/// generated route for
/// [ParkTabPage]
class ParkTabRoute extends PageRouteInfo<void> {
  const ParkTabRoute({List<PageRouteInfo>? children})
    : super(ParkTabRoute.name, initialChildren: children);

  static const String name = 'ParkTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ParkTabPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [SettingsTabPage]
class SettingsTabRoute extends PageRouteInfo<void> {
  const SettingsTabRoute({List<PageRouteInfo>? children})
    : super(SettingsTabRoute.name, initialChildren: children);

  static const String name = 'SettingsTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsTabPage();
    },
  );
}
