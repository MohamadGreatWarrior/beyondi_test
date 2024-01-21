import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/global/di/modules/firebase_module/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  @singleton
  Future<FirebaseApp> getFirebaseApp() {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
