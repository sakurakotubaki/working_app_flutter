import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:working_app_flutter/app/router/app_router.dart';
import 'package:working_app_flutter/feature/park/park_gallery_assets.dart';

@RoutePage()
class ParkPage extends HookConsumerWidget {
  const ParkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('公園')),
      body: GridView.builder(
        padding: const EdgeInsets.all(1),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 1,
        ),
        itemCount: kParkGalleryImages.length,
        itemBuilder: (context, index) {
          final path = kParkGalleryImages[index];
          return GestureDetector(
            onTap: () => context.router.push(ParkDetailsRoute(imageAsset: path)),
            child: Hero(
              tag: path,
              child: Material(
                color: Colors.grey.shade200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
