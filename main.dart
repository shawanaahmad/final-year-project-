import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'authentication_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const KidsIslamicHubApp());
}

class KidsIslamicHubApp extends StatelessWidget {
  const KidsIslamicHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Kids Islamic Hub',

      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins',
      ),

      /// FIRST SCREEN
      initialRoute: '/',

      /// ROUTES NAVIGATION
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}