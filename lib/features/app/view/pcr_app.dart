import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_car_renting/features/app/view/pcr_material_app.dart';
import 'package:p2p_car_renting/features/authentication/bloc/authentication_bloc.dart';
import 'package:p2p_car_renting/global/di/di.dart';
import 'package:p2p_car_renting/global/repos/repos.dart';

class PcrApp extends StatelessWidget {
  const PcrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => get<UserRepo>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => get<AuthenticationBloc>(),
          ),
        ],
        child: const PcrMaterialApp(),
      ),
    );
  }
}
