import 'dart:io';

import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.color,
    this.onTap,
  });

  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Platform.isIOS ? 8.0 : 0,
      ),
      child: BackButton(
        color: color,
        onPressed: onTap,
      ),
    );
  }
}
