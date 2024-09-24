// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: _getFirebaseOptions(),
  );
}

FirebaseOptions _getFirebaseOptions() {
  if (kIsWeb) {
    return FirebaseOptions(
      apiKey: 'AIzaSyAk0CVa8yuZfD4Y1vvfpWFkjKLUxdUsI6Q',
      appId: '1:1097786523679:web:e2b80827bac41efc9a952a',
      messagingSenderId: '1097786523679',
      projectId: 'sinappnet',
      authDomain: 'sinappnet.firebaseapp.com',
      storageBucket: 'sinappnet.appspot.com',
    );
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return FirebaseOptions(
        apiKey: 'AIzaSyB0KdMNLzBh26bJ7w9Jz0hUZ3iQiHKWHZs',
        appId: '1:1097786523679:android:a4c58017d190909d9a952a',
        messagingSenderId: '1097786523679',
        projectId: 'sinappnet',
        storageBucket: 'sinappnet.appspot.com',
      );
    case TargetPlatform.iOS:
      return FirebaseOptions(
        apiKey: 'AIzaSyDheQo42T-SA0mdbCNdHe5VWbcY76JAoto',
        appId: '1:1097786523679:ios:6fa1ff9f8f384d959a952a',
        messagingSenderId: '1097786523679',
        projectId: 'sinappnet',
        storageBucket: 'sinappnet.appspot.com',
        iosBundleId: 'com.sinapp.aplicativo',
      );
    default:
      throw UnsupportedError(
        'FirebaseOptions are not supported for this platform.',
      );
  }
}
