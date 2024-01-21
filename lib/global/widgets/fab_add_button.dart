import 'package:flutter/material.dart';
import 'package:p2p_car_renting/global/theme/theme_x.dart';
import 'package:p2p_car_renting/global/widgets/scaled_builder.dart';

class FabAddButton extends StatelessWidget {
  const FabAddButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ScaledBuilder(
      scaleOrigin: Alignment.center,
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: context.cs.primaryContainer,
        onPressed: onTap,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
