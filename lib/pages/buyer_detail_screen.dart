import 'package:flutter/material.dart';

import 'buyer_home_screen.dart';

class BuyerDetailScreen
    extends StatefulWidget {

  const BuyerDetailScreen({
    super.key,
  });

  @override
  State<BuyerDetailScreen>
  createState() =>
      _BuyerDetailScreenState();
}

class _BuyerDetailScreenState
    extends State<
    BuyerDetailScreen> {

  TextEditingController
  phoneController =
  TextEditingController();

  TextEditingController
  addressController =
  TextEditingController();

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
          "Lengkapi Data",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(
              "Data Pembeli",

              style: TextStyle(
                fontSize: 28,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Lengkapi informasi akunmu",

              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 35),

            TextField(
              controller:
              phoneController,

              decoration:
              InputDecoration(

                hintText:
                "Nomor HP",

                prefixIcon:
                const Icon(
                  Icons.phone,
                ),

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

                prefixIcon:
                const Icon(
                  Icons.location_on,
                ),

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

            const SizedBox(height: 35),

            Container(
              width: double.infinity,

              padding:
              const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                    18),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.verified_user,
                    color:
                    Color(0xFFD8B4FE),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      "Akun pembeli akan digunakan untuk melakukan transaksi jastip.",
                    ),
                  ),

                ],
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
                      const BuyerHomeScreen(),
                    ),
                  );

                },

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  const Color(0xFFD8B4FE),

                  shape:
                  RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(
                        18),
                  ),
                ),

                child: const Text(
                  "Simpan",

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