import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_car_renting/global/repos/repos.dart';

mixin AuthenticationMixin<T extends StatefulWidget> on State<T> {
  late final UserRepo userRepo = context.read();

  @override
  void initState() {
    super.initState();

    userRepo.registerUserAuthListener(onUserAuthChanged);
  }

  @override
  void dispose() {
    userRepo.unregisterUserAuthListener(onUserAuthChanged);

    super.dispose();
  }

  void onUserAuthChanged(String? signedInUser);
}
