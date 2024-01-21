// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAXNtq7Hm1rS_vH87_-0GhAbvnYDpR-qFo',
    appId: '1:208321988215:web:f4c1e08a61fd3c80bd6872',
    messagingSenderId: '208321988215',
    projectId: 'p2p-renting-car',
    authDomain: 'p2p-renting-car.firebaseapp.com',
    storageBucket: 'p2p-renting-car.appspot.com',
    measurementId: 'G-R4SDF17FTM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDJ1g9U5Zl_6OklKBtt4veOSlXxi51uXE',
    appId: '1:208321988215:android:b5a280bbb073354abd6872',
    messagingSenderId: '208321988215',
    projectId: 'p2p-renting-car',
    storageBucket: 'p2p-renting-car.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2ayMDsG-BmzFlh72_Nn8_l5ss7mCzH1Q',
    appId: '1:208321988215:ios:65ee9d34ad3372fabd6872',
    messagingSenderId: '208321988215',
    projectId: 'p2p-renting-car',
    storageBucket: 'p2p-renting-car.appspot.com',
    iosBundleId: 'com.example.p2pCarRenting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2ayMDsG-BmzFlh72_Nn8_l5ss7mCzH1Q',
    appId: '1:208321988215:ios:060af1f008d395fdbd6872',
    messagingSenderId: '208321988215',
    projectId: 'p2p-renting-car',
    storageBucket: 'p2p-renting-car.appspot.com',
    iosBundleId: 'com.example.p2pCarRenting.RunnerTests',
  );
}
