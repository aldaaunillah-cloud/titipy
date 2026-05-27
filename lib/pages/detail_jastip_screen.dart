import 'package:flutter/material.dart';
import 'edit_jastip_screen.dart';

class DetailJastipScreen extends StatelessWidget {
  const DetailJastipScreen({super.key});

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

                const Text(
                  "SEVENTEEN RIGHT HERE",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Official Lightstick Ver.3",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Rp850.000",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD8B4FE),
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Stock: 10",
                  style: TextStyle(
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

                const Text(
                  "Official merchandise SEVENTEEN RIGHT HERE TOUR berupa lightstick resmi original dengan kondisi baru dan tersegel.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.7,
                  ),
                ),

                const SizedBox(height: 40),

                Row(
                  children: [

                    Expanded(
                      child: SizedBox(
                        height: 55,

                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                    const EditJastipScreen(),
                              ),
                            );
                          },

                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color(0xFFD8B4FE),
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                          ),

                          child: const Text(
                            "Edit",
                            style: TextStyle(
                              color: Color(0xFFD8B4FE),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: SizedBox(
                        height: 55,

                        child: ElevatedButton(
                          onPressed: () {

                            showDialog(
                              context: context,

                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Hapus Jastip",
                                  ),

                                  content: const Text(
                                    "Apakah kamu yakin ingin menghapus jastip ini?",
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

                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },

                                      child: const Text(
                                        "Hapus",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),

                                  ],
                                );
                              },
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                          ),

                          child: const Text(
                            "Hapus",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}