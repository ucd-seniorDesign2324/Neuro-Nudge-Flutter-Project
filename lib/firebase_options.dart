// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiExFR0f-4AkzYI0ZNhavxcC-FDfblDUs',
    appId: '1:921813581612:android:ad2cc80889b02845edf689',
    messagingSenderId: '921813581612',
    projectId: 'neuro-nudge',
    databaseURL: 'https://neuro-nudge-default-rtdb.firebaseio.com',
    storageBucket: 'neuro-nudge.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCAajE6Hsv1IMATgXhH5bOxR8zMPh9e6I',
    appId: '1:921813581612:ios:8b62b043137169d1edf689',
    messagingSenderId: '921813581612',
    projectId: 'neuro-nudge',
    databaseURL: 'https://neuro-nudge-default-rtdb.firebaseio.com',
    storageBucket: 'neuro-nudge.appspot.com',
    androidClientId: '921813581612-9h4bfoh5omlo5o2p1m8ksrr4fufm8ldq.apps.googleusercontent.com',
    iosBundleId: 'com.example.nn.RunnerTests',
  );
}
