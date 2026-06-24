// ============================================================
// splash_screen.dart
// Kids Islamic Hub — Pehli Screen
// Green background + logo + animation + 3.5 sec baad next screen
// ============================================================

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  // --- Teen animation controllers ---
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _pulseController;

  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();

    // 1. Fade — logo dheere appear hota hai
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeIn,
      ),
    );

    // 2. Scale — logo bounce karke aata hai
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _scaleAnim = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.elasticOut,
      ),
    );

    // 3. Pulse — background circles saans lete hain
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.88, end: 1.0).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    // Animations start karo
    _fadeController.forward();
    _scaleController.forward();

    // 3.5 second baad next screen pe jao
    Future.delayed(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const Scaffold(
              backgroundColor: Color(0xFF2E7D32),
              body: Center(
                child: Text(
                  'Home Screen Coming Soon!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    // Memory free karo
    _fadeController.dispose();
    _scaleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [

          // =============================================
          // Background circles — pulse animation
          // =============================================
          AnimatedBuilder(
            animation: _pulseAnim,
            builder: (_, __) {
              return Stack(
                children: [

                  // Top right circle
                  Positioned(
                    top: -size.height * 0.1,
                    right: -size.width * 0.2,
                    child: Container(
                      width: size.width * 0.72 * _pulseAnim.value,
                      height: size.width * 0.72 * _pulseAnim.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.07),
                      ),
                    ),
                  ),

                  // Bottom left circle
                  Positioned(
                    bottom: -size.height * 0.07,
                    left: -size.width * 0.15,
                    child: Container(
                      width: size.width * 0.58,
                      height: size.width * 0.58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.06),
                      ),
                    ),
                  ),

                  // Right middle circle
                  Positioned(
                    top: size.height * 0.32,
                    right: -size.width * 0.06,
                    child: Container(
                      width: size.width * 0.32,
                      height: size.width * 0.32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // =============================================
          // Center — Logo + App Name + Loader
          // =============================================
          Center(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // App Logo
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppRadius.xl,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          '📖',
                          style: TextStyle(fontSize: 60),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // App Name
                    const Text(
                      'Kids Islamic Hub',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Tagline
                    Text(
                      'Learn · Recite · Grow 🌱',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.82),
                        letterSpacing: 0.8,
                      ),
                    ),

                    const SizedBox(height: 52),

                    // Loading spinner
                    SizedBox(
                      width: 34,
                      height: 34,
                      child: CircularProgressIndicator(
                        color: Colors.white.withOpacity(0.85),
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // =============================================
          // Bismillah — screen ke neeche
          // =============================================
          Positioned(
            bottom: 28,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: Text(
                'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.68),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}