import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:working_app_flutter/app/providers/onboarding_provider.dart';
import 'package:working_app_flutter/app/router/app_router.dart';
import 'package:working_app_flutter/common/text_component.dart';

@RoutePage()
class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final pageIndex = useState(0);
    const pageCount = 2;

    Future<void> finish() async {
      await ref.read(onboardingProvider.notifier).complete();
      if (!context.mounted) return;
      context.router.replace(const MainShellRoute());
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: finish,
                child: const Text('スキップ'),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (i) => pageIndex.value = i,
                children: const [
                  _OnboardingStep(
                    asset: 'assets/lottie/park.json',
                    title: '公園に出かけましょう!',
                  ),
                  _OnboardingStep(
                    asset: 'assets/lottie/walking.json',
                    title: '歩いて健康に',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageCount,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: pageIndex.value == i
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    if (pageIndex.value < pageCount - 1) {
                      await pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                      );
                    } else {
                      await finish();
                    }
                  },
                  child: Text(pageIndex.value < pageCount - 1 ? '次へ' : 'はじめる'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingStep extends StatelessWidget {
  const _OnboardingStep({
    required this.asset,
    required this.title,
  });

  final String asset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(asset),
          const SizedBox(height: 24),
          TextComponent.title(title),
        ],
      ),
    );
  }
}
