// ============================================================
// app_theme.dart
// Kids Islamic Hub — App ka poora color & style system
// Yahan se saari screens colors lengi
// ============================================================

import 'package:flutter/material.dart';

// ============================================================
// COLORS — Poori app ke colors yahan hain
// ============================================================
class AppColors {
  // Main green colors
  static const Color primary = Color(0xFF2E7D32);       // Dark forest green
  static const Color primaryLight = Color(0xFF4CAF50);  // Medium green
  static const Color primaryPale = Color(0xFFE8F5E9);   // Very light green

  // Module card colors
  static const Color tajweedCard = Color(0xFF43A047);   // Tajweed — green
  static const Color supplicationCard = Color(0xFF1976D2); // Duas — blue
  static const Color mannersCard = Color(0xFFF9A825);   // Manners — yellow

  // Extra colors
  static const Color accent = Color(0xFFFFC107);        // Golden — stars ke liye
  static const Color orange = Color(0xFFFF7043);        // Orange — mic button
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF9FBF9);      // Background
  static const Color textDark = Color(0xFF1B3A1C);      // Dark text
  static const Color textMedium = Color(0xFF4A6C4B);    // Medium text
  static const Color textLight = Color(0xFF9E9E9E);     // Light/hint text
  static const Color divider = Color(0xFFE0E0E0);       // Lines
  static const Color success = Color(0xFF43A047);       // Green tick
  static const Color error = Color(0xFFE53935);         // Red error
}

// ============================================================
// TEXT STYLES — Poori app ke fonts yahan hain
// ============================================================
class AppTextStyles {
  // Bara heading — jaise "Who's learning today?"
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );

  // Medium heading — jaise screen title
  static const TextStyle headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );

  // Chhota heading — jaise card title
  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  // Normal text — jaise description
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textMedium,
  );

  // Chhota text — jaise subtitle
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textMedium,
  );

  // Bahut chhota text — jaise labels
  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
  );

  // Button ka text
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
}

// ============================================================
// BORDER RADIUS — Rounded corners ke liye
// ============================================================
class AppRadius {
  static const double small = 8.0;    // Thoda rounded
  static const double medium = 16.0;  // Medium rounded
  static const double large = 24.0;   // Zyada rounded
  static const double xl = 32.0;      // Bahut rounded
  static const double full = 100.0;   // Bilkul gol (circle jaisa)
}

// ============================================================
// SPACING — Screens mein gaps ke liye
// ============================================================
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

// ============================================================
// APP THEME — MaterialApp mein use hoga
// ============================================================
class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      // Material 3 — Google ka latest design
      useMaterial3: true,

      // Main color
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),

      // Background color
      scaffoldBackgroundColor: AppColors.offWhite,

      // AppBar style
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headingMedium,
        iconTheme: IconThemeData(color: AppColors.primary),
      ),

      // Button style — bade rounded buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.large),
          ),
          textStyle: AppTextStyles.buttonText,
          elevation: 4,
        ),
      ),

      // Input field style
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primaryPale,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.medium),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        hintStyle: AppTextStyles.bodyMedium,
      ),

      // Card style
      cardTheme: CardThemeData(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.large),
        ),
        color: AppColors.white,
      ),
    );
  }
}