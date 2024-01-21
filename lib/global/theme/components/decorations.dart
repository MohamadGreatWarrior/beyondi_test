import 'package:flutter/material.dart';
import 'package:p2p_car_renting/global/theme/theme.dart';

abstract class AppDecorations {
  static BoxDecoration getPhotoDecoration(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: context.cs.onSurface,
      border: Border.all(
        color: Theme.of(context).colorScheme.secondary,
        width: 3.2,
      ),
    );
  }

  static BoxDecoration getProfileDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.cs.background,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: context.cs.onBackground.withOpacity(0.1),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
