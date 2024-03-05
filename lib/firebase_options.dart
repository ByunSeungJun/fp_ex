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
    apiKey: 'AIzaSyAYJoKbl9aiAvSvEtf5bhc8yxXWK7mWaHY',
    appId: '1:137109629915:web:1c8ff5865bdbed703615fe',
    messagingSenderId: '137109629915',
    projectId: 'fineplay-f0706',
    authDomain: 'fineplay-f0706.firebaseapp.com',
    storageBucket: 'fineplay-f0706.appspot.com',
    measurementId: 'G-ER9XKJQSJE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKbcD-5u_ae40Apg8rgtrpyL4eLdMN8ko',
    appId: '1:137109629915:android:fc95feadf5726cfe3615fe',
    messagingSenderId: '137109629915',
    projectId: 'fineplay-f0706',
    storageBucket: 'fineplay-f0706.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUdU3vP3GW-tgzEpKkXFqCpV40ednKjsU',
    appId: '1:137109629915:ios:818c2d16da0b4b163615fe',
    messagingSenderId: '137109629915',
    projectId: 'fineplay-f0706',
    storageBucket: 'fineplay-f0706.appspot.com',
    iosBundleId: 'com.example.fpEx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUdU3vP3GW-tgzEpKkXFqCpV40ednKjsU',
    appId: '1:137109629915:ios:101bdbe2855510a73615fe',
    messagingSenderId: '137109629915',
    projectId: 'fineplay-f0706',
    storageBucket: 'fineplay-f0706.appspot.com',
    iosBundleId: 'com.example.fpEx.RunnerTests',
  );
}