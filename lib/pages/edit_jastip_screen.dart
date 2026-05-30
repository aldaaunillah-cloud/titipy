import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_config.dart';
import '../services/websocket_service.dart';

class EditJastipScreen extends StatefulWidget {
  final Map data;

  const EditJastipScreen({
    super.key,
    required this.data,
  });

  @override
  State<EditJastipScreen> createState() =>
      _EditJastipScreenState();
}

class _EditJastipScreenState
    extends State<EditJastipScreen> {

  late TextEditingController namaController;
  late TextEditingController deskripsiController;
  late TextEditingController hargaController;
  late TextEditingController stokController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.data["nama_barang"],
    );

    deskripsiController = TextEditingController(
      text: widget.data["deskripsi"],
    );

    hargaController = TextEditingController(
      text: widget.data["harga"],
    );

    stokController = TextEditingController(
      text: widget.data["stok"],
    );
  }

  Future updateJastip() async {

    var url = Uri.parse(
      "${ApiConfig.baseUrl}/update_jastip.php",
    );

    var response = await http.post(
      url,

      body: {
        "id": widget.data["id"],
        "nama_barang": namaController.text,
        "deskripsi": deskripsiController.text,
        "harga": hargaController.text,
        "stok": stokController.text,
      },
    );

    var data = jsonDecode(response.body);

    if (data["success"] == true) {

      WebSocketService().send("update");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Data berhasil diupdate",
          ),
        ),
      );

      Navigator.pop(context);

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Gagal update data",
          ),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7FF),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          children: [

            TextField(
              controller: namaController,

              decoration: const InputDecoration(
                hintText: "Nama Barang",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: deskripsiController,

              decoration: const InputDecoration(
                hintText: "Deskripsi",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: hargaController,

              decoration: const InputDecoration(
                hintText: "Harga",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: stokController,

              decoration: const InputDecoration(
                hintText: "Stok",
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  updateJastip();

                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFFD8B4FE),
                ),

                child: const Text(
                  "Update",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}