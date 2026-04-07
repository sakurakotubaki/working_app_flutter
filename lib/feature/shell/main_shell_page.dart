import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:working_app_flutter/app/router/app_router.dart';

@RoutePage()
class MainShellPage extends StatelessWidget {
  const MainShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ParkTabRoute(),
        SettingsTabRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.park_outlined),
              activeIcon: Icon(Icons.park),
              label: '公園',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: '設定',
            ),
          ],
        );
      },
    );
  }
}
