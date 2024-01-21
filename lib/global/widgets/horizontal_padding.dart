import 'package:flutter/material.dart';

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      );
}
