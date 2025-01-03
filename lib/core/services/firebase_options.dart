// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ..
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
    apiKey: 'AIzaSyC9ljOdzm10VXADb-5UlX44_1anQATTbXo',
    appId: '1:195606516545:web:ae586fff86727f359847c0',
    messagingSenderId: '195606516545',
    projectId: 'guideme-45329',
    authDomain: 'guideme-45329.firebaseapp.com',
    storageBucket: 'guideme-45329.firebasestorage.app',
    measurementId: 'G-SRSZPS50XY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuehU6-Wz0QG4pMwo6coeLNWRfCu-ArNY',
    appId: '1:195606516545:android:b65547cc5e016ef49847c0',
    messagingSenderId: '195606516545',
    projectId: 'guideme-45329',
    storageBucket: 'guideme-45329.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8Py3W4WD_xVl3TlBYQuiz6ye1hYkeNRI',
    appId: '1:195606516545:ios:358cde9ac22922da9847c0',
    messagingSenderId: '195606516545',
    projectId: 'guideme-45329',
    storageBucket: 'guideme-45329.firebasestorage.app',
    iosBundleId: 'com.example.guideme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8Py3W4WD_xVl3TlBYQuiz6ye1hYkeNRI',
    appId: '1:195606516545:ios:358cde9ac22922da9847c0',
    messagingSenderId: '195606516545',
    projectId: 'guideme-45329',
    storageBucket: 'guideme-45329.firebasestorage.app',
    iosBundleId: 'com.example.guideme',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC9ljOdzm10VXADb-5UlX44_1anQATTbXo',
    appId: '1:195606516545:web:b43e6a18043f7fb89847c0',
    messagingSenderId: '195606516545',
    projectId: 'guideme-45329',
    authDomain: 'guideme-45329.firebaseapp.com',
    storageBucket: 'guideme-45329.firebasestorage.app',
    measurementId: 'G-5D446KY88R',
  );
}
