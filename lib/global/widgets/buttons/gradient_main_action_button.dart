import 'package:flutter/material.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';
import 'package:p2p_car_renting/global/utils/utils.dart';

class GradientMainActionButton extends StatelessWidget {
  const GradientMainActionButton({
    super.key,
    this.margin = EdgeInsets.zero,
    this.enabled = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12.5,
      vertical: 12.5,
    ),
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
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.getGradient(context),
        borderRadius: AppConstants.borderRadius10,
      ),
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: padding,
          visualDensity: visualDensity,
        ),
        onPressed: enabled ? onTap : null,
        child: child ?? Text(text, style: textStyle),
      ),
    );
  }
}
