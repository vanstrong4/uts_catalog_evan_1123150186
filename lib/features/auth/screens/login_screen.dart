import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              Center(child: Image.asset("images/ecs.png", height: 180)),

              SizedBox(height: 20),

              Text(
                "Login",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text(
                "Masuk ke akun kamu",
                style: TextStyle(color: Colors.grey),
              ),

              SizedBox(height: 30),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: UnderlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: UnderlineInputBorder(),
                ),
              ),

              SizedBox(height: 30),
