import 'package:flutter/material.dart';
import 'create_jastip_screen.dart';
import 'detail_jastip_screen.dart';

class JastiperHomeScreen extends StatelessWidget {
  const JastiperHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FF),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFD8B4FE),

        onPressed: () {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  const CreateJastipScreen(),
            ),
          );
        },

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        selectedItemColor: const Color(0xFFD8B4FE),
        unselectedItemColor: Colors.grey,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Jastip",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),

        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: const [

                        Text(
                          "Hello, Jastiper 👋",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4B5563),
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          "Kelola jasa titipmu dengan mudah",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),

                    const CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          Color(0xFFD8B4FE),

                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 35),

                Row(
                  children: [

                    Expanded(
                      child: dashboardCard(
                        title: "Total Jastip",
                        value: "12",
                        icon: Icons.shopping_bag_outlined,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: dashboardCard(
                        title: "Pesanan",
                        value: "28",
                        icon: Icons.receipt_long_outlined,
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 35),

                const Text(
                  "Jastip Saya",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                            const DetailJastipScreen(),
                      ),
                    );
                  },

                  child: jastipItem(
                    concert: "SEVENTEEN RIGHT HERE",
                    item: "Official Lightstick",
                    stock: "Stock: 10",
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                            const DetailJastipScreen(),
                      ),
                    );
                  },

                  child: jastipItem(
                    concert: "NCT DREAM TOUR",
                    item: "Official Hoodie",
                    stock: "Stock: 5",
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboardCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        children: [

          Icon(
            icon,
            size: 35,
            color: const Color(0xFFD8B4FE),
          ),

          const SizedBox(height: 15),

          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4B5563),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }

  Widget jastipItem({
    required String concert,
    required String item,
    required String stock,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          Container(
            width: 90,
            height: 90,

            decoration: BoxDecoration(
              color: const Color(0xFFE9D5FF),
              borderRadius: BorderRadius.circular(20),
            ),

            child: const Icon(
              Icons.shopping_bag_rounded,
              size: 40,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  concert,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  item,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  stock,
                  style: const TextStyle(
                    color: Color(0xFFD8B4FE),
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}