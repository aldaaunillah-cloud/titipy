import 'package:flutter/material.dart';
import 'edit_jastip_screen.dart';

class DetailJastipScreen extends StatelessWidget {

  final Map data;

  const DetailJastipScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7FF),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },

          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4B5563),
          ),
        ),

        title: const Text(
          "Detail Jastip",
          style: TextStyle(
            color: Color(0xFF4B5563),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Container(
                  height: 250,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: const Color(0xFFE9D5FF),
                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: const Center(
                    child: Icon(
                      Icons.shopping_bag_rounded,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  data["nama_barang"],

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  data["deskripsi"],

                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "Rp ${data["harga"]}",

                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD8B4FE),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Stock: ${data["stok"]}",

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Deskripsi",

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  data["deskripsi"],

                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.7,
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) =>
                              EditJastipScreen(
                            data: data,
                          ),
                        ),
                      );

                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFFD8B4FE),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(18),
                      ),
                    ),

                    child: const Text(
                      "Edit",

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
        ),
      ),
    );
  }
}