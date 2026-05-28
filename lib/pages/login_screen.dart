import 'package:flutter/material.dart';

import '../services/google_auth_service.dart';

import 'buyer_detail_screen.dart';
import 'jastiper_verification_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {

  final String role;

  const LoginScreen({
    super.key,
    required this.role,
  });

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  TextEditingController
  emailController =
  TextEditingController();

  TextEditingController
  passwordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
      const Color(0xFFFDF7FF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 60),

              const Text(
                "Welcome Back 👋",

                style: TextStyle(
                  fontSize: 34,
                  fontWeight:
                  FontWeight.bold,

                  color:
                  Color(0xFF4B5563),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Login ke akun Titipy",

                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 45),

              TextField(
                controller:
                emailController,

                decoration:
                InputDecoration(

                  hintText:
                  "Email",

                  filled: true,
                  fillColor:
                  Colors.white,

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                        18),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller:
                passwordController,

                obscureText: true,

                decoration:
                InputDecoration(

                  hintText:
                  "Password",

                  filled: true,
                  fillColor:
                  Colors.white,

                  border:
                  OutlineInputBorder(

                    borderRadius:
                    BorderRadius.circular(
                        18),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  onPressed: () {

                    Navigator.pushReplacement(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>

                        widget.role == "buyer"

                            ? const BuyerDetailScreen()

                            : const JastiperVerificationScreen(),
                      ),
                    );

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
                    "Login",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(

                  onPressed: () async {

                    var userCredential =
                    await GoogleAuthService()
                        .signInWithGoogle();

                    if (userCredential != null) {

                      Navigator.pushReplacement(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>

                          widget.role == "buyer"

                              ? const BuyerDetailScreen()

                              : const JastiperVerificationScreen(),
                        ),
                      );
                    }
                  },

                  icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/281/281764.png",
                    height: 24,
                  ),

                  label: const Text(
                    "Login dengan Google",

                    style: TextStyle(
                      color:
                      Color(0xFF4B5563),

                      fontSize: 16,
                    ),
                  ),

                  style:
                  OutlinedButton.styleFrom(

                    side: const BorderSide(
                      color:
                      Color(0xFFD8B4FE),
                    ),

                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(
                          18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  const Text(
                    "Belum punya akun?",
                  ),

                  TextButton(

                    onPressed: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>
                              RegisterScreen(
                                role:
                                widget.role,
                              ),
                        ),
                      );

                    },

                    child: const Text(
                      "Register",
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}