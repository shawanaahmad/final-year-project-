import 'package:flutter/material.dart';
import 'authentication_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // ✅ const constructor

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AuthScreen(), // ✅ navigate forward
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/logo.png"),
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              "Kids Islamic Hub",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}