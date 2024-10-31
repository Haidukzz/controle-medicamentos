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
    apiKey: 'AIzaSyAMCwRNIuw0qk5nFX-OlYFylXvRfqUMiVA',
    appId: '1:367426872948:web:a0021a243687a893d01321',
    messagingSenderId: '367426872948',
    projectId: 'controle-de-medicamentos-8f122',
    authDomain: 'controle-de-medicamentos-8f122.firebaseapp.com',
    storageBucket: 'controle-de-medicamentos-8f122.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAK9fXmKE-yT8DdchdosEnR28NMk4rVwuk',
    appId: '1:367426872948:android:e42543137d149a63d01321',
    messagingSenderId: '367426872948',
    projectId: 'controle-de-medicamentos-8f122',
    storageBucket: 'controle-de-medicamentos-8f122.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_xqewdJWK0jiY09BG4kS40NtPmzeR03U',
    appId: '1:367426872948:ios:7ee9b71cd1f1068ed01321',
    messagingSenderId: '367426872948',
    projectId: 'controle-de-medicamentos-8f122',
    storageBucket: 'controle-de-medicamentos-8f122.appspot.com',
    iosClientId: '367426872948-hd24rut7sem49lvjm862aukia5m3hqa0.apps.googleusercontent.com',
    iosBundleId: 'com.example.controledemedicamentos',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_xqewdJWK0jiY09BG4kS40NtPmzeR03U',
    appId: '1:367426872948:ios:7ee9b71cd1f1068ed01321',
    messagingSenderId: '367426872948',
    projectId: 'controle-de-medicamentos-8f122',
    storageBucket: 'controle-de-medicamentos-8f122.appspot.com',
    iosClientId: '367426872948-hd24rut7sem49lvjm862aukia5m3hqa0.apps.googleusercontent.com',
    iosBundleId: 'com.example.controledemedicamentos',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAMCwRNIuw0qk5nFX-OlYFylXvRfqUMiVA',
    appId: '1:367426872948:web:2dd2d2886622a959d01321',
    messagingSenderId: '367426872948',
    projectId: 'controle-de-medicamentos-8f122',
    authDomain: 'controle-de-medicamentos-8f122.firebaseapp.com',
    storageBucket: 'controle-de-medicamentos-8f122.appspot.com',
  );
}
