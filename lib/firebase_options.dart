// File: lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: 'your_api_key',
        appId: 'your_app_id',
        messagingSenderId: 'your_messaging_sender_id',
        projectId: 'your_project_id',
        authDomain: 'your_auth_domain',
        databaseURL: 'your_database_url',
        storageBucket: 'your_storage_bucket',
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return const FirebaseOptions(
        apiKey: 'your_android_api_key',
        appId: 'your_android_app_id',
        messagingSenderId: 'your_android_messaging_sender_id',
        projectId: 'your_android_project_id',
        authDomain: 'your_android_auth_domain',
        databaseURL: 'your_android_database_url',
        storageBucket: 'your_android_storage_bucket',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const FirebaseOptions(
        apiKey: 'your_ios_api_key',
        appId: 'your_ios_app_id',
        messagingSenderId: 'your_ios_messaging_sender_id',
        projectId: 'your_ios_project_id',
        authDomain: 'your_ios_auth_domain',
        databaseURL: 'your_ios_database_url',
        storageBucket: 'your_ios_storage_bucket',
      );
    }

    throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
  }
}
