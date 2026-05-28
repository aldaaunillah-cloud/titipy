import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'create_jastip_screen.dart';
import 'edit_jastip_screen.dart';
import 'profile_screen.dart';

class JastiperHomeScreen extends StatefulWidget {
  const JastiperHomeScreen({super.key});

  @override
  State<JastiperHomeScreen> createState() =>
      _JastiperHomeScreenState();
}

class _JastiperHomeScreenState
    extends State<JastiperHomeScreen> {

  List dataJastip = [];

  Future getJastip() async {

    var url = Uri.parse(
      "http://192.168.0.101/titipy_api/get_jastip.php",
    );

    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      dataJastip = data["data"];
    });

  }

  Future deleteJastip(String id) async {

    var url = Uri.parse(
      "http://192.168.0.101/titipy_api/delete_jastip.php",
    );

    await http.post(
      url,

      body: {
        "id": id,
      },
    );

    getJastip();

  }

  @override
  void initState() {
    super.initState();

    getJastip();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7FF),
        elevation: 0,

        title: const Text(
          "Jastip Saya",

          style: TextStyle(
            color: Color(0xFF4B5563),
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (context) =>
                  const ProfileScreen(),
                ),
              );

            },

            icon: const Icon(
              Icons.person,
              color: Color(0xFF4B5563),
            ),
          ),

        ],
      ),

      body: ListView.builder(
        itemCount: dataJastip.length,

        itemBuilder: (context, index) {

          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Container(
                  width: 80,
                  height: 80,

                  decoration: BoxDecoration(
                    color: const Color(0xFFD8B4FE),

                    borderRadius:
                    BorderRadius.circular(18),
                  ),

                  child: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 35,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        dataJastip[index]
                        ["nama_barang"],

                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,

                          color:
                          Color(0xFF4B5563),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        dataJastip[index]
                        ["deskripsi"],

                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Rp ${dataJastip[index]["harga"]}",

                        style: const TextStyle(
                          color:
                          Color(0xFFD8B4FE),

                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      Text(
                        "Stok: ${dataJastip[index]["stok"]}",

                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [

                          ElevatedButton(

                            onPressed: () async {

                              await Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditJastipScreen(
                                        data:
                                        dataJastip[index],
                                      ),
                                ),
                              );

                              getJastip();

                            },

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(
                                  0xFFD8B4FE),
                            ),

                            child: const Text(
                              "Edit",

                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          ElevatedButton(

                            onPressed: () async {

                              showDialog(
                                context: context,

                                builder: (context) {

                                  return AlertDialog(

                                    title: const Text(
                                      "Konfirmasi",
                                    ),

                                    content: const Text(
                                      "Yakin ingin menghapus data ini?",
                                    ),

                                    actions: [

                                      TextButton(

                                        onPressed: () {
                                          Navigator.pop(context);
                                        },

                                        child: const Text(
                                          "Batal",
                                        ),
                                      ),

                                      ElevatedButton(

                                        onPressed: () async {

                                          Navigator.pop(context);

                                          await deleteJastip(
                                            dataJastip[index]["id"],
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Data berhasil dihapus",
                                              ),
                                            ),
                                          );

                                        },

                                        style:
                                        ElevatedButton.styleFrom(
                                          backgroundColor:
                                          Colors.red,
                                        ),

                                        child: const Text(
                                          "Hapus",

                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),

                                    ],
                                  );

                                },
                              );

                            },

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              Colors.red,
                            ),

                            child: const Text(
                              "Hapus",

                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );

        },
      ),

      floatingActionButton:
      FloatingActionButton(
        backgroundColor:
        const Color(0xFFD8B4FE),

        onPressed: () async {

          await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
              const CreateJastipScreen(),
            ),
          );

          getJastip();

        },

        child: const Icon(Icons.add),
      ),
    );
  }
}