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
    apiKey: 'AIzaSyCFKKEqXYLAygVeUTtvEkFrsWPwiVnLWDc',
    appId: '1:332772899485:web:4602b11eb91cacad6db274',
    messagingSenderId: '332772899485',
    projectId: 'geprek-masdion',
    authDomain: 'geprek-masdion.firebaseapp.com',
    storageBucket: 'geprek-masdion.appspot.com',
    measurementId: 'G-V6S0P4KQFQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC--v-yC89gATaBYFjJpzmpbWuGDm5Y8Qg',
    appId: '1:332772899485:android:a349b694f754c9c76db274',
    messagingSenderId: '332772899485',
    projectId: 'geprek-masdion',
    storageBucket: 'geprek-masdion.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAt0Oy8p2oElojQRWxILL771AgpESd8WhI',
    appId: '1:332772899485:ios:c41a7689fc95939a6db274',
    messagingSenderId: '332772899485',
    projectId: 'geprek-masdion',
    storageBucket: 'geprek-masdion.appspot.com',
    iosClientId: '332772899485-5ftcamhjsgucppcn6mrm3no6kgvbl4su.apps.googleusercontent.com',
    iosBundleId: 'com.kodenatan.geprek-masdion.geprekMasdion',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAt0Oy8p2oElojQRWxILL771AgpESd8WhI',
    appId: '1:332772899485:ios:c41a7689fc95939a6db274',
    messagingSenderId: '332772899485',
    projectId: 'geprek-masdion',
    storageBucket: 'geprek-masdion.appspot.com',
    iosClientId: '332772899485-5ftcamhjsgucppcn6mrm3no6kgvbl4su.apps.googleusercontent.com',
    iosBundleId: 'com.kodenatan.geprek-masdion.geprekMasdion',
  );
}