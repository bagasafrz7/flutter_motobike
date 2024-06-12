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
    apiKey: 'AIzaSyCjWMYb3fe7nkjjmWZWYgY_SSSS-pcNWKY',
    appId: '1:1004409392325:web:3956804a276843f35234ac',
    messagingSenderId: '1004409392325',
    projectId: 'motobike-2b7b0',
    authDomain: 'motobike-2b7b0.firebaseapp.com',
    storageBucket: 'motobike-2b7b0.appspot.com',
    measurementId: 'G-KT4JQGGWBC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMWkISLChWiEjtriaR0RKfrHCCTQ6N1v8',
    appId: '1:1004409392325:android:15f44b3f497f55c65234ac',
    messagingSenderId: '1004409392325',
    projectId: 'motobike-2b7b0',
    storageBucket: 'motobike-2b7b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEXH6CvfQluIUp6c2Po9YweKxPAHVSKsQ',
    appId: '1:1004409392325:ios:d65a558693a7f8655234ac',
    messagingSenderId: '1004409392325',
    projectId: 'motobike-2b7b0',
    storageBucket: 'motobike-2b7b0.appspot.com',
    iosBundleId: 'com.example.flutterMotobike',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEXH6CvfQluIUp6c2Po9YweKxPAHVSKsQ',
    appId: '1:1004409392325:ios:d65a558693a7f8655234ac',
    messagingSenderId: '1004409392325',
    projectId: 'motobike-2b7b0',
    storageBucket: 'motobike-2b7b0.appspot.com',
    iosBundleId: 'com.example.flutterMotobike',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCjWMYb3fe7nkjjmWZWYgY_SSSS-pcNWKY',
    appId: '1:1004409392325:web:4b9b38d3b401affc5234ac',
    messagingSenderId: '1004409392325',
    projectId: 'motobike-2b7b0',
    authDomain: 'motobike-2b7b0.firebaseapp.com',
    storageBucket: 'motobike-2b7b0.appspot.com',
    measurementId: 'G-TFZ97D6EY6',
  );
}