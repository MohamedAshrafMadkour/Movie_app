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
    apiKey: 'AIzaSyCofmjWdnZ61YI0uYQAvaPODRTudHEoCRg',
    appId: '1:894083425391:web:583e171dc50cecd0b8599a',
    messagingSenderId: '894083425391',
    projectId: 'movie-app-ebc91',
    authDomain: 'movie-app-ebc91.firebaseapp.com',
    storageBucket: 'movie-app-ebc91.firebasestorage.app',
    measurementId: 'G-G4VMM2RVPT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgPYvStPj-1B5uIzENaJXuhVvTmRZB9uo',
    appId: '1:894083425391:android:cd37675d46b30547b8599a',
    messagingSenderId: '894083425391',
    projectId: 'movie-app-ebc91',
    storageBucket: 'movie-app-ebc91.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbtg2hohetCghfdzPzK8D9GhNSOwRb9jY',
    appId: '1:894083425391:ios:461c94f48f67ac46b8599a',
    messagingSenderId: '894083425391',
    projectId: 'movie-app-ebc91',
    storageBucket: 'movie-app-ebc91.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbtg2hohetCghfdzPzK8D9GhNSOwRb9jY',
    appId: '1:894083425391:ios:461c94f48f67ac46b8599a',
    messagingSenderId: '894083425391',
    projectId: 'movie-app-ebc91',
    storageBucket: 'movie-app-ebc91.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCofmjWdnZ61YI0uYQAvaPODRTudHEoCRg',
    appId: '1:894083425391:web:3e4b74bee76b6889b8599a',
    messagingSenderId: '894083425391',
    projectId: 'movie-app-ebc91',
    authDomain: 'movie-app-ebc91.firebaseapp.com',
    storageBucket: 'movie-app-ebc91.firebasestorage.app',
    measurementId: 'G-M68DSPHHP3',
  );
}
