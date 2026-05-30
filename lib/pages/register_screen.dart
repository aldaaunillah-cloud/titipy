import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_config.dart';

import 'buyer_detail_screen.dart';
import 'jastiper_verification_screen.dart';

class RegisterScreen extends StatelessWidget {

  final String role;

  const RegisterScreen({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 50),

                const Text(
                  "Create Account ✨",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Daftar akun baru Titipy",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: nameController,

                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(18),

                      borderSide:
                      BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: emailController,

                  decoration: InputDecoration(
                    hintText: "Email",

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(18),

                      borderSide:
                      BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  obscureText: true,

                  decoration: InputDecoration(
                    hintText: "Password",

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(18),

                      borderSide:
                      BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () async {

                      var url = Uri.parse(
                        "${ApiConfig.baseUrl}/register.php",
                      );

                      var response =
                      await http.post(

                        url,

                        body: {

                          "name":
                          nameController.text,

                          "email":
                          emailController.text,

                          "password":
                          passwordController.text,

                          "role": role,

                        },
                      );

                      var data =
                      jsonDecode(response.body);

                      if (data["success"] == true) {

                        if (role == "buyer") {

                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                              const BuyerDetailScreen(),
                            ),
                          );

                        } else {

                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                              const JastiperVerificationScreen(),
                            ),
                          );

                        }

                      } else {

                        ScaffoldMessenger.of(context)
                            .showSnackBar(

                          const SnackBar(
                            content: Text(
                              "Register gagal",
                            ),
                          ),
                        );

                      }

                    },

                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      const Color(
                          0xFFD8B4FE),

                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(
                            18),
                      ),
                    ),

                    child: const Text(
                      "Register",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(

                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Sudah punya akun? Login",
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