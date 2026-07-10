import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB9YxCculP1YxZ3cUPO2n9ieVv-_-a3afg",
            authDomain: "feehafloos.firebaseapp.com",
            projectId: "feehafloos",
            storageBucket: "feehafloos.firebasestorage.app",
            messagingSenderId: "419220498092",
            appId: "1:419220498092:web:49385467e8b3e5f3e0a109",
            measurementId: "G-5RQN1NHWEB"));
  } else {
    await Firebase.initializeApp();
  }
}
