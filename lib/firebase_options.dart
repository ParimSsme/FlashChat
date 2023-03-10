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
    apiKey: 'AIzaSyD9fPZ5U6rjC7ygJEnbU3nANDpGUWDFLrU',
    appId: '1:412894726508:web:8f5d34cffa9df52a124b49',
    messagingSenderId: '412894726508',
    projectId: 'flash-chat-79aca',
    authDomain: 'flash-chat-79aca.firebaseapp.com',
    storageBucket: 'flash-chat-79aca.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBfWuUXO1jrgE6im_KmhGVdixP-_T7Vb0',
    appId: '1:412894726508:android:0864e1881f326471124b49',
    messagingSenderId: '412894726508',
    projectId: 'flash-chat-79aca',
    storageBucket: 'flash-chat-79aca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDows8d9LC-uuxsPxx908VgpmE6eR-wIlY',
    appId: '1:412894726508:ios:5137cf085c15ddb2124b49',
    messagingSenderId: '412894726508',
    projectId: 'flash-chat-79aca',
    storageBucket: 'flash-chat-79aca.appspot.com',
    iosClientId: '412894726508-sajqmggfs76751729dku599gs1hsqibq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChatStartingProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDows8d9LC-uuxsPxx908VgpmE6eR-wIlY',
    appId: '1:412894726508:ios:5137cf085c15ddb2124b49',
    messagingSenderId: '412894726508',
    projectId: 'flash-chat-79aca',
    storageBucket: 'flash-chat-79aca.appspot.com',
    iosClientId: '412894726508-sajqmggfs76751729dku599gs1hsqibq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flashChatStartingProject',
  );
}
