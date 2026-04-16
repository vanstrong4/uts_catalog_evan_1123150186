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
      body: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.lightBlue,
            displayColor: Colors.lightBlue,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),

                        Center(
                          child: Image.asset("images/ecs.png", height: 180),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[700],
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          "Buat akun baru",
                          style: TextStyle(color: Colors.lightBlue),
                        ),

                        SizedBox(height: 30),

                        TextField(
                          controller: nameController,
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(
                            hintText: "Nama",
                            hintStyle: TextStyle(
                              color: Colors.lightBlue.shade200,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.lightBlue.shade200,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.lightBlue.shade200,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.lightBlue),
                          decoration: InputDecoration(
                            hintText: "Konfirmasi Password",
                            hintStyle: TextStyle(
                              color: Colors.lightBlue.shade200,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

         
}
