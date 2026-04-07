import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:working_app_flutter/app/router/app_router.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('利用規約'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement navigation to Terms of Service page
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('プライバシーポリシー'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement navigation to Privacy Policy page
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('アプリの使い方'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Implement navigation to How To Use page
            },
          ),
          ListTile(
            leading: const Icon(Icons.code_outlined),
            title: const Text('Flutterライセンス'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.router.push(const AppLicensesRoute()),
          ),
          const SizedBox(height: 32),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'バージョン: 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
