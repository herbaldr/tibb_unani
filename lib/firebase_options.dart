import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'

    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // if (kIsWeb) {
    //   return web;
    // }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
    // case TargetPlatform.iOS:
    //   return ios;
    // case TargetPlatform.macOS:
    //   throw UnsupportedError(
    //     'DefaultFirebaseOptions have not been configured for macos - '
    //         'you can reconfigure this by running the FlutterFire CLI again.',
    //   );
    // case TargetPlatform.windows:
    //   throw UnsupportedError(
    //     'DefaultFirebaseOptions have not been configured for windows - '
    //         'you can reconfigure this by running the FlutterFire CLI again.',
    //   );
    // case TargetPlatform.linux:
    //   throw UnsupportedError(
    //     'DefaultFirebaseOptions have not been configured for linux - '
    //         'you can reconfigure this by running the FlutterFire CLI again.',
    //   );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // static const FirebaseOptions web = FirebaseOptions(
  //   apiKey: 'AIzaSyCbEDI9VQ86zuQKKDsuRJI43S1rMcpk-9g',
  //   appId: '1:834057438239:web:b4f6729984f92bb54b812a',
  //   messagingSenderId: '834057438239',
  //   projectId: 'wallyapp-347da',
  //   authDomain: 'wallyapp-347da.firebaseapp.com',
  //   storageBucket: 'wallyapp-347da.appspot.com',
  //   measurementId: 'G-1JCTDK66TK',
  // );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvWMbhNqu9Qvqqatrm7Hbe1wCrlyYEmSk',
    appId: '1:626461240558:android:69d694bb37186bd23897ff',
    messagingSenderId: '626461240558',
    projectId: 'hikmatonline-d9fbb',
    storageBucket: 'hikmatonline-d9fbb.appspot.com',
  );

// static const FirebaseOptions ios = FirebaseOptions(
//   apiKey: 'AIzaSyA9WuGuUpbyTvBHVfqBVImVXjVKYmZGU8E',
//   appId: '1:834057438239:ios:bc8b742a6e979bb64b812a',
//   messagingSenderId: '834057438239',
//   projectId: 'wallyapp-347da',
//   storageBucket: 'wallyapp-347da.appspot.com',
//   androidClientId: '834057438239-vdr5th85jov0gdkb4aorccqki5cfs1dn.apps.googleusercontent.com',
//   iosClientId: '834057438239-g2de3040a3ji597cg1s0sg9ap4p8uu31.apps.googleusercontent.com',
//   iosBundleId: 'com.example.wallyapp',
// );
}
