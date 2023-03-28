import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAHwQ27DUVTbvUJRDsMLlflMPC8CnAsCQA",
            authDomain: "ssvc-a97d5.firebaseapp.com",
            projectId: "ssvc-a97d5",
            storageBucket: "ssvc-a97d5.appspot.com",
            messagingSenderId: "847999955420",
            appId: "1:847999955420:web:6a3fd42f73e840e259df19",
            measurementId: "G-YV954Y35D9"));
  } else {
    await Firebase.initializeApp();
  }
}
