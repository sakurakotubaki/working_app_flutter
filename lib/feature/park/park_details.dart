import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ParkDetailsPage extends HookConsumerWidget {
  const ParkDetailsPage({
    super.key,
    required this.imageAsset,
  });

  final String imageAsset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('公園の詳細'),
        backgroundColor: Colors.black38,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Hero(
        tag: imageAsset,
        child: Material(
          color: Colors.black,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
