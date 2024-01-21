import 'package:flutter/material.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    super.key,
    this.margin = EdgeInsets.zero,
    this.enabled = true,
    this.padding,
    required this.text,
    this.child,
    this.textStyle,
    this.visualDensity,
    this.onTap,
  });

  final EdgeInsetsGeometry margin;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final String text;
  final Widget? child;
  final TextStyle? textStyle;
  final VisualDensity? visualDensity;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          visualDensity: visualDensity,
        ),
        onPressed: enabled ? onTap : null,
        child: child ?? Text(text, style: textStyle),
      ),
    );
  }
}
