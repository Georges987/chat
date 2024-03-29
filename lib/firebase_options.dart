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
    apiKey: 'AIzaSyCBwlDz9M56dpqJPosuCQUHV7lTL35mras',
    appId: '1:93557244648:web:deba46b5da8594deb5bf5d',
    messagingSenderId: '93557244648',
    projectId: 'chatt-e4ccc',
    authDomain: 'chatt-e4ccc.firebaseapp.com',
    storageBucket: 'chatt-e4ccc.appspot.com',
    measurementId: 'G-7JNKMNRDWX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxpswIpSUjObo_IwmWy-tMcmhb8LyAb1w',
    appId: '1:93557244648:android:d3be5649413ba9dcb5bf5d',
    messagingSenderId: '93557244648',
    projectId: 'chatt-e4ccc',
    storageBucket: 'chatt-e4ccc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZ_ii5GPfZrzKB-7RAr39Ff3l3NjOblog',
    appId: '1:93557244648:ios:ae7cf46846e36e8fb5bf5d',
    messagingSenderId: '93557244648',
    projectId: 'chatt-e4ccc',
    storageBucket: 'chatt-e4ccc.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZ_ii5GPfZrzKB-7RAr39Ff3l3NjOblog',
    appId: '1:93557244648:ios:16b7f293d8791f0cb5bf5d',
    messagingSenderId: '93557244648',
    projectId: 'chatt-e4ccc',
    storageBucket: 'chatt-e4ccc.appspot.com',
    iosBundleId: 'com.example.chat.RunnerTests',
  );
}
