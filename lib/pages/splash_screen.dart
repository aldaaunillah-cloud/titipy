import 'dart:async';

import 'package:flutter/material.dart';
import 'role_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),

      () {
        Navigator.pushReplacement(
          context,

          MaterialPageRoute(
            builder: (context) => const RoleScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.shopping_bag_rounded,
              size: 90,
              color: Color(0xFFD8B4FE),
            ),

            const SizedBox(height: 20),

            const Text(
              "Titipy",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B5563),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Trusted K-Pop Merchandise Jastip App",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

          ],
        ),
      ),
    );
  }
}