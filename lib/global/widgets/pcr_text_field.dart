import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';

class PcrTextField extends StatelessWidget {
  const PcrTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.onSubmitted,
    this.initialText,
    this.trailingText,
    this.labelColor,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.errorText,
    this.suffixIcon,
    this.obscureText = false,
    this.textInputAction,
    this.textDirection,
    this.onTap,
  });

  final String? initialText;
  final String label;
  final String hint;
  final Widget? trailingText;
  final Color? labelColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final String? errorText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final trailingText = this.trailingText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: context.ts.labelLarge?.copyWith(
            color: labelColor,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: enabled ? null : onTap,
          child: Directionality(
            textDirection: textDirection ?? Directionality.of(context),
            child: TextFormField(
              initialValue: initialText,
              style: TextStyle(color: context.cs.onBackground),
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              enabled: enabled,
              decoration: InputDecoration(
                errorText: errorText,
                errorMaxLines: 2,
                errorStyle: TextStyle(
                  fontSize: 15.sp,
                  color: context.cs.error,
                ),
                hintText: hint,
                suffixIcon: suffixIcon,
              ),
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
            ),
          ),
        ),
        if (trailingText != null) trailingText,
      ],
    );
  }
}
