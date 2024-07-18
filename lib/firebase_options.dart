// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBk6khRlcB1uv7zEVwpyQshDKFbjqQZYOE',
    appId: '1:462532468234:web:4bc3961c5b4b85fed4c9f3',
    messagingSenderId: '462532468234',
    projectId: 'zonk-fbbb1',
    authDomain: 'zonk-fbbb1.firebaseapp.com',
    databaseURL: 'https://zonk-fbbb1-default-rtdb.firebaseio.com',
    storageBucket: 'zonk-fbbb1.appspot.com',
    measurementId: 'G-78GJ6J64F0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaZWnJ0KrnuL_ile3HbJwrtD_zspXj0Lw',
    appId: '1:462532468234:android:e939271ddad63f13d4c9f3',
    messagingSenderId: '462532468234',
    projectId: 'zonk-fbbb1',
    databaseURL: 'https://zonk-fbbb1-default-rtdb.firebaseio.com',
    storageBucket: 'zonk-fbbb1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpoIC1vLu2nT15ioUH_j5LM8ZjNx45wyE',
    appId: '1:462532468234:ios:e8bf89cb5b8911a6d4c9f3',
    messagingSenderId: '462532468234',
    projectId: 'zonk-fbbb1',
    databaseURL: 'https://zonk-fbbb1-default-rtdb.firebaseio.com',
    storageBucket: 'zonk-fbbb1.appspot.com',
    iosBundleId: 'com.thirtytwobrain.labApk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpoIC1vLu2nT15ioUH_j5LM8ZjNx45wyE',
    appId: '1:462532468234:ios:a9f9e5af11ae827fd4c9f3',
    messagingSenderId: '462532468234',
    projectId: 'zonk-fbbb1',
    databaseURL: 'https://zonk-fbbb1-default-rtdb.firebaseio.com',
    storageBucket: 'zonk-fbbb1.appspot.com',
    iosBundleId: 'com.example.jonkLab',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBk6khRlcB1uv7zEVwpyQshDKFbjqQZYOE',
    appId: '1:462532468234:web:4e7588a76c920d9cd4c9f3',
    messagingSenderId: '462532468234',
    projectId: 'zonk-fbbb1',
    authDomain: 'zonk-fbbb1.firebaseapp.com',
    databaseURL: 'https://zonk-fbbb1-default-rtdb.firebaseio.com',
    storageBucket: 'zonk-fbbb1.appspot.com',
    measurementId: 'G-8750FW68CZ',
  );
}
