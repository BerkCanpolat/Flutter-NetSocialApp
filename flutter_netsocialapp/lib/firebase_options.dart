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
    apiKey: 'AIzaSyAtJiw66QZJ_Y8oCO1eL0MOkp6gEqIrd90',
    appId: '1:981936485357:web:d71167558d818d1204ede4',
    messagingSenderId: '981936485357',
    projectId: 'netsocialapp-8357c',
    authDomain: 'netsocialapp-8357c.firebaseapp.com',
    storageBucket: 'netsocialapp-8357c.appspot.com',
    measurementId: 'G-94ZYLFVV3W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_70WH9Q7SEey3AKjIXJ7HrISBTUoJjY4',
    appId: '1:981936485357:android:f1e8e789d7e8909f04ede4',
    messagingSenderId: '981936485357',
    projectId: 'netsocialapp-8357c',
    storageBucket: 'netsocialapp-8357c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-Lj3HTlDhN8kVOLENzbe8rt891Jpd0QI',
    appId: '1:981936485357:ios:449f74689b7aad8004ede4',
    messagingSenderId: '981936485357',
    projectId: 'netsocialapp-8357c',
    storageBucket: 'netsocialapp-8357c.appspot.com',
    iosClientId: '981936485357-q7glcsp81ai9b42i4ikralf4gdu6p55s.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterNetsocialapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-Lj3HTlDhN8kVOLENzbe8rt891Jpd0QI',
    appId: '1:981936485357:ios:d4949a94c364bb6a04ede4',
    messagingSenderId: '981936485357',
    projectId: 'netsocialapp-8357c',
    storageBucket: 'netsocialapp-8357c.appspot.com',
    iosClientId: '981936485357-6rhgc3bjmcvt8d7r23o2t2f2abom9b68.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterNetsocialapp.RunnerTests',
  );
}
