import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBb54yTjp4wp-yl9P6JOe6JYbJ6HRtIpT8",
            authDomain: "trobits-80ac6.firebaseapp.com",
            projectId: "trobits-80ac6",
            storageBucket: "trobits-80ac6.appspot.com",
            messagingSenderId: "311204757285",
            appId: "1:311204757285:web:13f34454c219011459a4cc",
            measurementId: "G-J7DQ1TLBQS"));
  } else {
    await Firebase.initializeApp();
  }
}
