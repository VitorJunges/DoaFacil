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
    apiKey: 'AIzaSyDdzdINN1dCx8iIBgK8SonxpQ58SzTKnz0',
    appId: '1:141627001757:web:dc620d500506cc97917d74',
    messagingSenderId: '141627001757',
    projectId: 'ong-topicos',
    authDomain: 'ong-topicos.firebaseapp.com',
    databaseURL: 'https://ong-topicos-default-rtdb.firebaseio.com',
    storageBucket: 'ong-topicos.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDU1z9NjLzpUmUBKwsxTCZ4EFmbqA3Q-vg',
    appId: '1:141627001757:android:14bc5931191e2686917d74',
    messagingSenderId: '141627001757',
    projectId: 'ong-topicos',
    databaseURL: 'https://ong-topicos-default-rtdb.firebaseio.com',
    storageBucket: 'ong-topicos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTxSMzAF3hkZSW1koDrR6ShNkyH-qEr8Y',
    appId: '1:141627001757:ios:37051e6e44cd9660917d74',
    messagingSenderId: '141627001757',
    projectId: 'ong-topicos',
    databaseURL: 'https://ong-topicos-default-rtdb.firebaseio.com',
    storageBucket: 'ong-topicos.appspot.com',
    iosClientId: '141627001757-dq2vej7t68276fe7kc81ldlf7n579q8b.apps.googleusercontent.com',
    iosBundleId: 'com.example.topicosInicio',
  );
}
