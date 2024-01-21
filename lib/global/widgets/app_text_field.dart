import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p2p_car_renting/global/theme/theme_x.dart';
import 'package:p2p_car_renting/global/utils/app_flutter_icons.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.margin = EdgeInsets.zero,
    this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.style,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.errorText,
    this.textDirection,
    this.errorBorder,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixText,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.fill,
    this.fillColor,
    this.isPassword = false,
    this.boxShadow,
    this.borderRadius,
    this.isDense = false,
    this.initialText,
  });

  final EdgeInsetsGeometry margin;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final String? errorText;
  final TextDirection? textDirection;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final String? suffixText;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final bool? fill;
  final Color? fillColor;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;
  final bool isPassword;
  final bool isDense;
  final String? initialText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool passwordIsEncrypted = true;

  Widget? suffixIcon;

  String? errorText;

  late TextInputAction? textInputAction = widget.textInputAction;

  @override
  void initState() {
    super.initState();

    errorText = widget.errorText;
    suffixIcon = widget.suffixIcon;
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      errorText = widget.errorText;
      suffixIcon = widget.suffixIcon;
      textInputAction = widget.textInputAction;
    });
  }

  @override
  Widget build(BuildContext context) {
    final suffixIcon = this.suffixIcon;

    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      child: TextFormField(
        initialValue: widget.initialText,
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.isPassword ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        style: TextStyle(color: context.cs.tertiary).merge(widget.style),
        textInputAction: textInputAction,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        textDirection: widget.textDirection,
        decoration: InputDecoration(
          isDense: widget.isDense,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          labelText: widget.labelText,
          errorText: errorText,
          filled: widget.fill,
          fillColor: widget.fillColor,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon,
          suffix: widget.suffix,
          suffixText: widget.suffixText,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  child: passwordIsEncrypted
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.remove_red_eye,
                                color: context.cs.tertiary,
                                size: 25,
                              ),
                            ),
                            if (suffixIcon != null)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 4.0,
                                ),
                                child: suffixIcon,
                              ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              alignment: Alignment.center,
                              child: Icon(
                                AppFlutterIcons.eye_slash,
                                color: context.cs.tertiary,
                                size: 17,
                              ),
                            ),
                            if (suffixIcon != null)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 7.0,
                                ),
                                child: suffixIcon,
                              ),
                          ],
                        ),
                  onTap: () {
                    setState(() {
                      passwordIsEncrypted = !passwordIsEncrypted;
                    });
                  },
                )
              : widget.suffixIcon,
          suffixIconConstraints: widget.suffixIconConstraints,
          border: widget.border,
          enabledBorder: widget.enabledBorder,
          focusedBorder: widget.focusedBorder,
          errorBorder: widget.errorBorder,
        ),
        //ignore: avoid_bool_literals_in_conditional_expressions
        obscureText: widget.isPassword ? passwordIsEncrypted : false,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        validator: widget.validator,
      ),
    );
  }
}
