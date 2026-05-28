import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/google_auth_service.dart';
import 'role_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final user =
        FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF6EFF8),

      appBar: AppBar(
        backgroundColor:
        const Color(0xFFF6EFF8),

        elevation: 0,

        title: const Text(
          "Profile",

          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(

          children: [

            const SizedBox(height: 30),

            CircleAvatar(
              radius: 50,

              backgroundImage:
              NetworkImage(
                user?.photoURL ?? ""),
            ),

            const SizedBox(height: 20),

            Text(
              user?.displayName ??
                  "User",

              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              user?.email ?? "",

              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () async {

                  await GoogleAuthService()
                      .logout();

                  Navigator.pushAndRemoveUntil(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                      const RoleScreen(),
                    ),

                        (route) => false,
                  );

                },

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  Colors.red,
                ),

                child: const Text(
                  "Logout",

                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}