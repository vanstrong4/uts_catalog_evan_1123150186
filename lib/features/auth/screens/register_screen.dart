import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                "Register",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text("Buat akun baru", style: TextStyle(color: Colors.grey)),

              SizedBox(height: 30),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Nama",
                  border: UnderlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),

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

              SizedBox(height: 20),

              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Konfirmasi Password",
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
                    String name = nameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    String confirmPassword = confirmPasswordController.text
                        .trim();

                    if (name.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        confirmPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Semua field harus diisi")),
                      );
                      return;
                    }

                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password tidak sama")),
                      );
                      return;
                    }

                    try {
                      await auth.signUp(email, password);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Register berhasil")),
                      );

                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Register gagal")));
                    }
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
