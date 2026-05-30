import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_config.dart';
import '../services/websocket_service.dart';

class CreateJastipScreen extends StatelessWidget {
  const CreateJastipScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final namaController = TextEditingController();
    final deskripsiController = TextEditingController();
    final hargaController = TextEditingController();
    final stokController = TextEditingController();

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
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(
                  "Tambah Jastip 🛍️",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Tambahkan produk jastip baru",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  "Nama Barang",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: namaController,

                  decoration: InputDecoration(
                    hintText: "Masukkan nama barang",

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
                  "Deskripsi",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: deskripsiController,
                  maxLines: 4,

                  decoration: InputDecoration(
                    hintText: "Masukkan deskripsi barang",

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
                  "Harga",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: hargaController,

                  decoration: InputDecoration(
                    hintText: "Masukkan harga",

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
                  "Stok",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                TextField(
                  controller: stokController,

                  decoration: InputDecoration(
                    hintText: "Masukkan stok",

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

                    onPressed: () async {

                      var url = Uri.parse(
                        "${ApiConfig.baseUrl}/create_jastip.php",
                      );

                      var response = await http.post(
                        url,

                        body: {
                          "nama_barang": namaController.text,
                          "deskripsi": deskripsiController.text,
                          "harga": hargaController.text,
                          "stok": stokController.text,
                        },
                      );

                      var data = jsonDecode(response.body);

                      if (data["success"] == true) {

                        WebSocketService().send("create");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Jastip berhasil ditambahkan",
                            ),
                          ),
                        );

                        Navigator.pop(context);

                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Gagal tambah jastip",
                            ),
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
                      "Simpan Jastip",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
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