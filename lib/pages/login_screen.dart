import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'buyer_home_screen.dart';
import 'jastiper_home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 60),

                const Text(
                  "Welcome Back 👋",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Login untuk melanjutkan ke aplikasi Titipy",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 50),

                const Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: "Masukkan email",

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: passwordController,
                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: "Masukkan password",

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () async {

                      var url = Uri.parse(
                        "http://192.168.0.107/titipy_api/login.php",
                      );

                      var response = await http.post(
                        url,

                        body: {
                          "email": emailController.text,
                          "password": passwordController.text,
                        },
                      );

                      var data = jsonDecode(response.body);

                      if (data["success"] == true) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login berhasil"),
                          ),
                        );

                        await Future.delayed(
                          const Duration(seconds: 1),
                        );

                        String role = data["data"]["role"];

                        if (role == "buyer") {

                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  const BuyerHomeScreen(),
                            ),
                          );

                        } else {

                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  const JastiperHomeScreen(),
                            ),
                          );

                        }

                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email atau password salah"),
                          ),
                        );

                      }

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD8B4FE),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Center(
                  child: TextButton(

                    onPressed: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                              const RegisterScreen(
                            role: 'buyer',
                          ),
                        ),
                      );

                    },

                    child: const Text(
                      "Belum punya akun? Register",
                      style: TextStyle(
                        color: Color(0xFFD8B4FE),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}