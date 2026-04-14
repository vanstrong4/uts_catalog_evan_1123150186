import 'package:flutter/material.dart';
import '../../../data/services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController, obscureText: true),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await auth.signIn(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("Login"),
            ),

            ElevatedButton(
              onPressed: () async {
                await auth.signInWithGoogle();
              },
              child: Text("Login with Google"),
            ),
          ],
        ),
      ),
    );
  }
}
