import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_car_renting/global/widgets/buttons/main_action_button.dart';
import 'package:p2p_car_renting/global/widgets/loading_indicator.dart';

class MainActionButtonWithStates<B extends StateStreamable<G>, G, S extends G,
    L extends S> extends StatelessWidget {
  const MainActionButtonWithStates({
    super.key,
    this.margin = EdgeInsets.zero,
    required this.text,
    this.textColor = Colors.black,
    this.borderRadius = 20,
    required this.listener,
    required this.onTap,
  });

  final EdgeInsetsGeometry margin;
  final String text;
  final Color textColor;
  final double borderRadius;
  final void Function(BuildContext, G) listener;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, G>(
      listenWhen: (previous, current) => current is S,
      listener: listener,
      buildWhen: (previous, current) => current is S,
      builder: (context, state) {
        return MainActionButton(
          margin: margin,
          text: state is L ? '' : text,
          onTap: onTap,
          child: state is L ? const LoadingIndicator(size: 19) : null,
        );
      },
    );
  }
}
