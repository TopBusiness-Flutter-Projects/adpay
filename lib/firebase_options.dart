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
    apiKey: 'AIzaSyC4aO0cL_oq2KbPRI5JQEOMMDwge8BIC_s',
    appId: '1:979222201210:web:2195ccf11a3bf433eb4cc3',
    messagingSenderId: '979222201210',
    projectId: 'adpay-edf24',
    authDomain: 'adpay-edf24.firebaseapp.com',
    databaseURL: 'https://adpay-edf24-default-rtdb.firebaseio.com',
    storageBucket: 'adpay-edf24.appspot.com',
    measurementId: 'G-H1B1SVD3SL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5Z89wejGw6nF4oDIoIG1beoSKboj1jsg',
    appId: '1:979222201210:android:bde689cab1d7e027eb4cc3',
    messagingSenderId: '979222201210',
    projectId: 'adpay-edf24',
    databaseURL: 'https://adpay-edf24-default-rtdb.firebaseio.com',
    storageBucket: 'adpay-edf24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlgvjteGCJG2lzOZld2rodlON9kg4A8jk',
    appId: '1:979222201210:ios:314f82dec2d5b853eb4cc3',
    messagingSenderId: '979222201210',
    projectId: 'adpay-edf24',
    databaseURL: 'https://adpay-edf24-default-rtdb.firebaseio.com',
    storageBucket: 'adpay-edf24.appspot.com',
    androidClientId: '979222201210-31uesqdvffh12nff6d86ubajctopdl5p.apps.googleusercontent.com',
    iosClientId: '979222201210-los0gvk1n7vrh2q8im7p9m4hdv796bl0.apps.googleusercontent.com',
    iosBundleId: 'com.topbusiness.adpayapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlgvjteGCJG2lzOZld2rodlON9kg4A8jk',
    appId: '1:979222201210:ios:314f82dec2d5b853eb4cc3',
    messagingSenderId: '979222201210',
    projectId: 'adpay-edf24',
    databaseURL: 'https://adpay-edf24-default-rtdb.firebaseio.com',
    storageBucket: 'adpay-edf24.appspot.com',
    androidClientId: '979222201210-31uesqdvffh12nff6d86ubajctopdl5p.apps.googleusercontent.com',
    iosClientId: '979222201210-los0gvk1n7vrh2q8im7p9m4hdv796bl0.apps.googleusercontent.com',
    iosBundleId: 'com.topbusiness.adpayapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC4aO0cL_oq2KbPRI5JQEOMMDwge8BIC_s',
    appId: '1:979222201210:web:2195ccf11a3bf433eb4cc3',
    messagingSenderId: '979222201210',
    projectId: 'adpay-edf24',
    authDomain: 'adpay-edf24.firebaseapp.com',
    databaseURL: 'https://adpay-edf24-default-rtdb.firebaseio.com',
    storageBucket: 'adpay-edf24.appspot.com',
    measurementId: 'G-H1B1SVD3SL',
  );

}