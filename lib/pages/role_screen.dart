import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

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
                "Masuk Sebagai",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B5563),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Pilih role untuk melanjutkan ke aplikasi Titipy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 50),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD8B4FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: const Text(
                    "Pembeli",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton(
                  onPressed: () {},

                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFD8B4FE),
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: const Text(
                    "Jastipers",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFD8B4FE),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}