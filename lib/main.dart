import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const TitipyApp());
}

class TitipyApp extends StatelessWidget {
  const TitipyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Titipy',
      home: const SplashScreen(),
    );
  }
}