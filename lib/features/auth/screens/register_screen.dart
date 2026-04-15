import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🔹 LOGO
                Container(
                  height: 100,
                  width: 100,
                  child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                ),

                SizedBox(height: 20),

                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await auth.signUp(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            child: Text("Register"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

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
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
