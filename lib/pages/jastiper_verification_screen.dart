import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'jastiper_home_screen.dart';

class JastiperVerificationScreen extends StatefulWidget {

  const JastiperVerificationScreen({
    super.key,
  });

  @override
  State<JastiperVerificationScreen> createState() =>
      _JastiperVerificationScreenState();
}

class _JastiperVerificationScreenState
    extends State<JastiperVerificationScreen> {

  TextEditingController shopController =
      TextEditingController();

  TextEditingController phoneController =
      TextEditingController();

  TextEditingController addressController =
      TextEditingController();

  File? ktpImage;
  File? selfieImage;

  final ImagePicker picker =
      ImagePicker();

  Future pickKtp() async {

    final pickedFile =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {

      setState(() {

        ktpImage =
            File(pickedFile.path);

      });
    }
  }

  Future pickSelfie() async {

    final pickedFile =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {

      setState(() {

        selfieImage =
            File(pickedFile.path);

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xFFFDF7FF),

      appBar: AppBar(
        backgroundColor:
            const Color(0xFFFDF7FF),

        elevation: 0,

        title: const Text(
          "Verifikasi Jastiper",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding:
            const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(
              "Verifikasi Akun",

              style: TextStyle(
                fontSize: 28,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Lengkapi data untuk menjadi jastiper terpercaya",

              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            TextField(
              controller:
                  shopController,

              decoration:
                  InputDecoration(

                hintText:
                    "Nama Toko",

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
                  phoneController,

              decoration:
                  InputDecoration(

                hintText:
                    "Nomor HP",

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
                  addressController,

              maxLines: 3,

              decoration:
                  InputDecoration(

                hintText:
                    "Alamat",

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

            const SizedBox(height: 25),

            GestureDetector(

              onTap: pickKtp,

              child: Container(
                width: double.infinity,
                height: 140,

                decoration:
                    BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          18),
                ),

                child: ktpImage == null

                    ? const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.badge,
                            size: 40,
                            color: Color(
                                0xFFD8B4FE),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Upload Foto KTP",
                          ),

                        ],
                      )

                    : ClipRRect(

                        borderRadius:
                            BorderRadius.circular(
                                18),

                        child: Image.file(
                          ktpImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(

              onTap: pickSelfie,

              child: Container(
                width: double.infinity,
                height: 140,

                decoration:
                    BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                          18),
                ),

                child: selfieImage == null

                    ? const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Color(
                                0xFFD8B4FE),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Upload Foto Diri",
                          ),

                        ],
                      )

                    : ClipRRect(

                        borderRadius:
                            BorderRadius.circular(
                                18),

                        child: Image.file(
                          selfieImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  Navigator.pushReplacement(

                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                          const JastiperHomeScreen(),
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
                  "Kirim Verifikasi",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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