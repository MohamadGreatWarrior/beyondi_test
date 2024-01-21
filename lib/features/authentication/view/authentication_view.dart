import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_car_renting/features/authentication/bloc/authentication_bloc.dart';
import 'package:p2p_car_renting/global/blocs/blocs.dart';
import 'package:p2p_car_renting/global/di/di.dart';
import 'package:p2p_car_renting/global/router/router.dart';

@RoutePage()
class AuthenticationView extends StatelessWidget {
  const AuthenticationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => get<PermissionsCubit>(),
      child: const AuthenticationPage(),
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late final AuthenticationBloc authenticationBloc = context.read();

  @override
  void initState() {
    super.initState();

    authenticationBloc.add(const CheckIfAuthenticated());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, GeneralAuthenticationState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (context) {
            return [
              if (state is BiometricsState) const BiometricsRoute(),
              if (state is AuthenticatedState) const MainNavigationRoute(),
              if (state is GuestState) const MainNavigationRoute(),
              if (state is UnauthenticatedState)
                SignInRoute(
                  showBackButton: state.showSignInBackButton,
                ),
              if (state is SignInState)
                SignInRoute(
                  showBackButton: state.showSignInBackButton,
                ),
            ];
          },
        );
      },
    );
  }
}
