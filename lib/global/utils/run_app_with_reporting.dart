import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_car_renting/global/blocs/observer/pcr_bloc_observer.dart';

Future<void> runAppWithReporting(
  Widget app, {
  required AsyncCallback preLaunch,
}) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await preLaunch();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      //Do reporting of errors here.

      Bloc.observer = PcrBlocObserver();
      runApp(app);
    },
    (error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      //Do reporting of errors here.
    },
  );
}
