import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'buyer_home_screen.dart';
import 'jastiper_home_screen.dart';

class CompleteProfileScreen extends StatefulWidget {

  final String role;

  const CompleteProfileScreen({
    super.key,
    required this.role,
  });

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState
    extends State<CompleteProfileScreen> {

  TextEditingController phoneController =
      TextEditingController();

  TextEditingController alamatController =
      TextEditingController();

  Future simpanProfile() async {

    SharedPreferences prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      "phone",
      phoneController.text,
    );

    await prefs.setString(
      "alamat",
      alamatController.text,
    );

    await prefs.setString(
      "role",
      widget.role,
    );

    await prefs.setBool(
      "profileComplete",
      true,
    );

    await prefs.setBool(
      "isLogin",
      true,
    );

    if (widget.role == "buyer") {

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

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lengkapi Profile",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: phoneController,

              decoration: const InputDecoration(
                labelText: "No HP",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: alamatController,

              decoration: const InputDecoration(
                labelText: "Alamat",
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  simpanProfile();

                },

                child: const Text(
                  "Simpan",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}