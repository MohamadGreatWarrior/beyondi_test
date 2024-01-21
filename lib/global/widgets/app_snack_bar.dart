import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:p2p_car_renting/global/theme/theme_x.dart';

abstract class AppSnackBar {
  static Future<T?> showInfoBar<T>({
    required BuildContext context,
    required Widget content,
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon = const Icon(Icons.info_outline),
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.surface,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.primary,
          icon: icon,
          content: content,
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showInfoMessageBar<T>(
    BuildContext context,
    String message, {
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon = const Icon(Icons.info_outline),
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.surface,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.primary,
          icon: icon,
          content: Text(message),
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showSuccessBar<T>({
    required BuildContext context,
    required Widget content,
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon = const Icon(Icons.check_circle_outline),
    Color? indicatorColor = const Color(0xFF81C784),
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          position: position,
          indicatorColor: indicatorColor,
          icon: icon,
          content: content,
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showSuccessMessageBar<T>(
    BuildContext context,
    String message, {
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    Color? foregroundColor,
    Icon? icon,
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          position: position,
          backgroundColor: backgroundColor,
          indicatorColor: indicatorColor ?? const Color(0xFF81C784),
          icon: icon ??
              Icon(
                Icons.check_circle_outline,
                color: foregroundColor,
              ),
          content: Text(
            message,
            style: TextStyle(color: context.cs.onBackground).merge(
              TextStyle(color: foregroundColor),
            ),
          ),
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showErrorBar<T>({
    required BuildContext context,
    required Widget content,
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon,
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.error,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.onError,
          icon: icon ??
              Icon(
                Icons.error_outline,
                color: context.cs.onError,
              ),
          content: content,
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }

  static Future<T?> showErrorMessageBar<T>(
    BuildContext context,
    String message, {
    FlashPosition position = FlashPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    Icon? icon,
    Color? indicatorColor,
    FlashBuilder<T>? primaryActionBuilder,
  }) {
    return showFlash<T>(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          backgroundColor: context.cs.error,
          position: position,
          indicatorColor: indicatorColor ?? context.cs.onError,
          icon: icon ??
              Icon(
                Icons.error_outline,
                color: context.cs.onError,
              ),
          content: Text(
            message,
            style: TextStyle(color: context.cs.onError),
          ),
          primaryAction: primaryActionBuilder?.call(context, controller),
        );
      },
    );
  }
}
