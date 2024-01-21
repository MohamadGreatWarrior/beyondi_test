import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ScaledBuilder extends StatelessWidget {
  const ScaledBuilder({
    super.key,
    required this.child,
    this.scaleOrigin,
    this.duration = const Duration(milliseconds: 750),
  });

  final Widget child;
  final Alignment? scaleOrigin;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          alignment: scaleOrigin,
          child: child,
        );
      },
      child: child,
    );
  }
}
