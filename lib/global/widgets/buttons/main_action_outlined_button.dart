import 'package:flutter/material.dart';

class MainActionOutlinedButton extends StatelessWidget {
  const MainActionOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.enabled = true,
    this.padding,
    this.textStyle,
    this.visualDensity,
    this.child,
  });

  final String text;
  final VoidCallback onTap;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final VisualDensity? visualDensity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        visualDensity: visualDensity,
      ),
      onPressed: enabled ? onTap : null,
      child: child ?? Text(text, style: textStyle),
    );
  }
}
