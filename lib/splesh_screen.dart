import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B2D82),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'FNBC',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(height: 10),
                Container(width: 90, height: 8, color: const Color(0xFFF2B705)),
                const SizedBox(height: 5),
                Container(width: 90, height: 8, color: const Color(0xFFF2B705)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
