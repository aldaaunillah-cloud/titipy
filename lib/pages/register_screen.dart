import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 40),

                const Text(
                  "Create Account ✨",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Daftar akun baru untuk menggunakan aplikasi Titipy",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 50),

                const Text(
                  "Nama Lengkap",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Masukkan nama lengkap",

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
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
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
                    onPressed: () {

                      if (role == 'buyer') {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                const BuyerDetailScreen(),
                          ),
                        );

                      } else {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                const JastiperVerificationScreen(),
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
                      "Lanjut",
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
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Sudah punya akun? Login",
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