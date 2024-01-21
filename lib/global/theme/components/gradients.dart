import 'package:flutter/cupertino.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';
import 'package:p2p_car_renting/global/theme/theme_extensions/app_theme_extension/app_theme_extension.dart';

abstract class AppGradients {
  static LinearGradient getGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        context.cs.primaryContainer,
        context.cs.primary,
      ],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    );
  }

  static LinearGradient getProgressGradient(BuildContext context) {
    return LinearGradient(
      colors: [
        context.cs.primaryContainer,
        context.cs.primary,
      ],
    );
  }

  static LinearGradient getSolidFree(BuildContext context) {
    return LinearGradient(
      colors: [
        context.appThemeExtension.freeBackground,
        context.appThemeExtension.freeBackground,
      ],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    );
  }

  static LinearGradient getSolidSurfaceVariant(BuildContext context) {
    return LinearGradient(
      colors: [
        context.cs.surfaceVariant,
        context.cs.surfaceVariant,
      ],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    );
  }

  static LinearGradient getSolidSecondary(BuildContext context) {
    return LinearGradient(
      colors: [
        context.cs.secondary,
        context.cs.secondary,
      ],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    );
  }

  static LinearGradient getSolidPrimary(BuildContext context) {
    return LinearGradient(
      colors: [
        context.cs.primary,
        context.cs.primary,
      ],
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
    );
  }
}
