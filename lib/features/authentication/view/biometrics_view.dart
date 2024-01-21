import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:p2p_car_renting/features/authentication/bloc/authentication_bloc.dart';
import 'package:p2p_car_renting/global/gen/assets.gen.dart';
import 'package:p2p_car_renting/global/utils/strings.dart';
import 'package:p2p_car_renting/global/widgets/app_snack_bar.dart';

@RoutePage()
class BiometricsView extends StatefulWidget {
  const BiometricsView({super.key});

  @override
  State<BiometricsView> createState() => _BiometricsViewState();
}

class _BiometricsViewState extends State<BiometricsView> {
  late final AuthenticationBloc authenticationBloc = context.read();

  @override
  void initState() {
    super.initState();

    authenticationBloc.add(
      AuthenticateBiometric(
        onError: () => AppSnackBar.showErrorMessageBar(
          context,
          Strings.noContinue,
          duration: const Duration(seconds: 5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.signIn.image(
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.2.sh,
          left: 0,
          right: 0,
          height: 0.5.sw,
          child: Assets.icons.fingerprint.image(),
        ),
      ],
    );
  }
}
