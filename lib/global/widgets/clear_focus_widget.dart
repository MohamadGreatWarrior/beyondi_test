import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class ClearFocusWidget extends StatefulWidget {
  const ClearFocusWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ClearFocusWidget> createState() => _ClearFocusWidgetState();
}

class _ClearFocusWidgetState extends State<ClearFocusWidget> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: widget.child,
      );
    }

    return widget.child;
  }
}
