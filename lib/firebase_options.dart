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
    apiKey: 'AIzaSyCNOZ2Tm3kD8JtxXAE0myHXgXYjJpxdHOs',
    appId: '1:570730126339:web:e711389e5d961e4ffbc236',
    messagingSenderId: '570730126339',
    projectId: 'axis-60c0f',
    authDomain: 'axis-60c0f.firebaseapp.com',
    storageBucket: 'axis-60c0f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxGgMh4RebL7cI7B97blCf0JfCmCt3yM0',
    appId: '1:570730126339:android:d152157017efff9afbc236',
    messagingSenderId: '570730126339',
    projectId: 'axis-60c0f',
    storageBucket: 'axis-60c0f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa4vp1Z4eKbWYBUbUiksXcAnNrXa7E8ZA',
    appId: '1:570730126339:ios:4ca39860892fc5bafbc236',
    messagingSenderId: '570730126339',
    projectId: 'axis-60c0f',
    storageBucket: 'axis-60c0f.appspot.com',
    iosClientId: '570730126339-qim3db2criimv8jhi80io726lnapinlq.apps.googleusercontent.com',
    iosBundleId: 'com.example.axisscouting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa4vp1Z4eKbWYBUbUiksXcAnNrXa7E8ZA',
    appId: '1:570730126339:ios:5b4cf99a0098bc68fbc236',
    messagingSenderId: '570730126339',
    projectId: 'axis-60c0f',
    storageBucket: 'axis-60c0f.appspot.com',
    iosClientId: '570730126339-sh60ao1a3enqljigsgvd6p73dguuv28p.apps.googleusercontent.com',
    iosBundleId: 'com.example.axisscouting.RunnerTests',
  );
}
