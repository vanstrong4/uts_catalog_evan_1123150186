import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './features/auth/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBUK2ge8jlP6jOqrPcMFrJebSv_oBDL5A0",
      authDomain: "evan-machine-store.firebaseapp.com",
      projectId: "evan-machine-store",
      storageBucket: "evan-machine-store.firebasestorage.app",
      messagingSenderId: "546996661047",
      appId: "1:546996661047:web:83807e710a1b8c193848b2",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evan Machine Store',
      home: SplashScreen(),
    );
  }
}
