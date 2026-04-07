import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [CustomRoute] 用: フェード + 軽いスケール + Y軸回転（カードがめくれて覆う印象）。
Widget parkDetailsTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curved = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );
  return FadeTransition(
    opacity: curved,
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1).animate(curved),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateY((1 - curved.value) * math.pi / 2),
        child: child,
      ),
    ),
  );
}
