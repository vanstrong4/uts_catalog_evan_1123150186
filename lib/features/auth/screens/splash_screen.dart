import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../catalog/screens/home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2)); // efek splash

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // 👉 sudah login (sementara ke halaman kosong dulu)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      // 👉 belum login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Evan Machine Store",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
