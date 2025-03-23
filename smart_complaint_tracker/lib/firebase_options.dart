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
    apiKey: 'AIzaSyA16oOlAyssC4NDG4dkKMlYsuNOrURI0O8',
    appId: '1:136098645114:web:cde98c2729893021e8e7c3',
    messagingSenderId: '136098645114',
    projectId: 'smart-complaint-issue-tracker',
    authDomain: 'smart-complaint-issue-tracker.firebaseapp.com',
    storageBucket: 'smart-complaint-issue-tracker.firebasestorage.app',
    measurementId: 'G-V6KF87PQ95',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOoAWhlK12g-uB8b5dRDP4xbRUzFifTBs',
    appId: '1:136098645114:android:65e42686c435d8d8e8e7c3',
    messagingSenderId: '136098645114',
    projectId: 'smart-complaint-issue-tracker',
    storageBucket: 'smart-complaint-issue-tracker.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCN6TjW86wXDejmYsy69XVnhwolk840Gy8',
    appId: '1:136098645114:ios:9fa89a3e65ac8247e8e7c3',
    messagingSenderId: '136098645114',
    projectId: 'smart-complaint-issue-tracker',
    storageBucket: 'smart-complaint-issue-tracker.firebasestorage.app',
    iosBundleId: 'com.example.smartComplaintTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCN6TjW86wXDejmYsy69XVnhwolk840Gy8',
    appId: '1:136098645114:ios:9fa89a3e65ac8247e8e7c3',
    messagingSenderId: '136098645114',
    projectId: 'smart-complaint-issue-tracker',
    storageBucket: 'smart-complaint-issue-tracker.firebasestorage.app',
    iosBundleId: 'com.example.smartComplaintTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA16oOlAyssC4NDG4dkKMlYsuNOrURI0O8',
    appId: '1:136098645114:web:6ccbbb4a36eccd53e8e7c3',
    messagingSenderId: '136098645114',
    projectId: 'smart-complaint-issue-tracker',
    authDomain: 'smart-complaint-issue-tracker.firebaseapp.com',
    storageBucket: 'smart-complaint-issue-tracker.firebasestorage.app',
    measurementId: 'G-9BHYPNCR9J',
  );
}
