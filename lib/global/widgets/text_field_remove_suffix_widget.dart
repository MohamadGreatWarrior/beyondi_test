import 'package:flutter/material.dart';
import 'package:p2p_car_renting/global/gen/assets.gen.dart';

class TextFieldRemoveSuffixWidget extends StatelessWidget {
  const TextFieldRemoveSuffixWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Assets.icons.remove.svg(
        width: 20,
        height: 20,
      ),
    );
  }
}
