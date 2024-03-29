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
    apiKey: 'AIzaSyAxv6vb7fnha3qhrnqdNmpC2XoTm7--QKc',
    appId: '1:371493227610:web:92843f5f2e4ff7e7479c63',
    messagingSenderId: '371493227610',
    projectId: 'my-mem-share',
    authDomain: 'my-mem-share.firebaseapp.com',
    storageBucket: 'my-mem-share.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgcNUgN1R3eRemeD_ADDwWNmGtGSxnS0s',
    appId: '1:371493227610:android:f177d668e68d1ebb479c63',
    messagingSenderId: '371493227610',
    projectId: 'my-mem-share',
    storageBucket: 'my-mem-share.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdiLb04t-zTwrETCQrZTS_snCs-tsQ_hI',
    appId: '1:371493227610:ios:ca550e395e23d228479c63',
    messagingSenderId: '371493227610',
    projectId: 'my-mem-share',
    storageBucket: 'my-mem-share.appspot.com',
    iosBundleId: 'com.example.memoryShare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdiLb04t-zTwrETCQrZTS_snCs-tsQ_hI',
    appId: '1:371493227610:ios:070ce4711f94718e479c63',
    messagingSenderId: '371493227610',
    projectId: 'my-mem-share',
    storageBucket: 'my-mem-share.appspot.com',
    iosBundleId: 'com.example.memoryShare.RunnerTests',
  );
}
