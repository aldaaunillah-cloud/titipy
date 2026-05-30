import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_config.dart';
import '../services/websocket_service.dart';

import 'profile_screen.dart';
import '../services/notification_service.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  int selectedIndex = 0;

  final List pages = [
    const HomePage(),
    const WishlistPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        selectedItemColor: const Color(0xFFD8B4FE),

        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataJastip = [];

  Future getJastip() async {
    var url = Uri.parse("${ApiConfig.baseUrl}/get_jastip.php");

    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      dataJastip = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();

    getJastip();

    WebSocketService().stream.listen((event) async {

  String title = "";
  String body = "";

  if (event == "create") {
    title = "Jastip Baru";
    body = "Produk baru telah ditambahkan";
  }

  else if (event == "update") {
    title = "Jastip Diperbarui";
    body = "Data produk telah diperbarui";
  }

  else if (event == "delete") {
    title = "Jastip Dihapus";
    body = "Produk telah dihapus";
  }

  if (title.isNotEmpty) {

    await NotificationService
        .flutterLocalNotificationsPlugin
        .show(
      0,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'titipy_channel',
          'Titipy Notification',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  if (mounted) {
    getJastip();
  }
});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [
                      Text(
                        "Hello, Alda 👋",

                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,

                          color: Color(0xFF4B5563),
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Cari jastip konser favoritmu!",

                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  CircleAvatar(
                    radius: 25,

                    backgroundColor: Color(0xFFD8B4FE),

                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              TextField(
                decoration: InputDecoration(
                  hintText: "Cari konser atau merchandise",

                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),

                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Kategori Konser",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                  color: Color(0xFF4B5563),
                ),
              ),

              const SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: [
                    categoryItem("SEVENTEEN"),

                    categoryItem("NCT"),

                    categoryItem("TXT"),

                    categoryItem("BLACKPINK"),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Jastip Populer 🔥",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                  color: Color(0xFF4B5563),
                ),
              ),

              const SizedBox(height: 20),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: dataJastip.length,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),

                    child: jastipCard(
                      concert: dataJastip[index]["nama_barang"],

                      item: dataJastip[index]["deskripsi"],

                      price: "Rp ${dataJastip[index]["harga"]}",
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(String title) {
    return Container(
      margin: const EdgeInsets.only(right: 15),

      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),
      ),

      child: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget jastipCard({
    required String concert,
    required String item,
    required String price,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            height: 160,

            decoration: BoxDecoration(
              color: const Color(0xFFE9D5FF),

              borderRadius: BorderRadius.circular(20),
            ),

            child: const Center(
              child: Icon(
                Icons.shopping_bag_rounded,

                size: 60,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            concert,

            style: const TextStyle(
              fontSize: 18,

              fontWeight: FontWeight.bold,

              color: Color(0xFF4B5563),
            ),
          ),

          const SizedBox(height: 10),

          Text(item, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 15),

          Text(
            price,

            style: const TextStyle(
              fontSize: 18,

              fontWeight: FontWeight.bold,

              color: Color(0xFFD8B4FE),
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Wishlist"));
  }
}
