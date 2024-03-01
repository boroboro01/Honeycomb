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
    apiKey: 'AIzaSyCv_8TxCcd6w7efi7ZZtXtsmR57WTmpSGI',
    appId: '1:223247954494:web:aebff699f4424f9f8cd76f',
    messagingSenderId: '223247954494',
    projectId: 'honeycomb-dc0bf',
    authDomain: 'honeycomb-dc0bf.firebaseapp.com',
    storageBucket: 'honeycomb-dc0bf.appspot.com',
    measurementId: 'G-2EY8JRT4Q9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-_1UsxlaQwq_vNNhPXMRxULgMrEVyIbE',
    appId: '1:223247954494:android:5e1137d1f17078a48cd76f',
    messagingSenderId: '223247954494',
    projectId: 'honeycomb-dc0bf',
    storageBucket: 'honeycomb-dc0bf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3hmh08UWRPdsTsebvy718IxREXDw4YUo',
    appId: '1:223247954494:ios:eaec2a9eba3937a78cd76f',
    messagingSenderId: '223247954494',
    projectId: 'honeycomb-dc0bf',
    storageBucket: 'honeycomb-dc0bf.appspot.com',
    iosBundleId: 'com.boroboro01.comb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3hmh08UWRPdsTsebvy718IxREXDw4YUo',
    appId: '1:223247954494:ios:1ccaf28ab06f711e8cd76f',
    messagingSenderId: '223247954494',
    projectId: 'honeycomb-dc0bf',
    storageBucket: 'honeycomb-dc0bf.appspot.com',
    iosBundleId: 'com.example.comb.RunnerTests',
  );
}