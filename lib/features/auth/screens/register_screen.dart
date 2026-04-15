import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  @override
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

              Center(child: Image.asset("assets/logo.png", height: 70)),

              SizedBox(height: 40),

              Text(
                "Register",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text("Buat akun baru", style: TextStyle(color: Colors.grey)),

              SizedBox(height: 30),

              TextField(
                controller: emailController,
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    await auth.signUp(
                      emailController.text,
                      passwordController.text,
                    );

                    // balik ke login setelah berhasil
                    Navigator.pop(context);
                  },
                  child: Text("Daftar"),
                ),
              ),

              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
