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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBfYGyuIZXuTJnPqWOkaaNkgMwgXd3nUsI',
    appId: '1:986104324472:web:1c17370653e814a797688d',
    messagingSenderId: '986104324472',
    projectId: 'restaurantecdjrv',
    authDomain: 'restaurantecdjrv.firebaseapp.com',
    storageBucket: 'restaurantecdjrv.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDh70SLQJFufWX4Pw0FfdnEOZf7AKMSxY',
    appId: '1:986104324472:android:b0bdc30757b0c15597688d',
    messagingSenderId: '986104324472',
    projectId: 'restaurantecdjrv',
    storageBucket: 'restaurantecdjrv.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkROtYBkJ6ujx-hSxFwfdYes8v-rD8WvI',
    appId: '1:986104324472:ios:a08e21213ce7211997688d',
    messagingSenderId: '986104324472',
    projectId: 'restaurantecdjrv',
    storageBucket: 'restaurantecdjrv.firebasestorage.app',
    iosBundleId: 'com.example.diegoAdministracionFlutter',
  );
}
