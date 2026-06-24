// ============================================================
// login_screen.dart
// Kids Islamic Hub — Login Screen
// Email + Password + Google login
// FR-02: Email-password/google sign in
// ============================================================

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text fields ke controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Password chhupi rahegi ya dikhegi
  bool _isPasswordVisible = false;

  // Sign In button dabane pe
  void _login() {
    // TODO: Yahan Supabase authentication call hoga
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Profile Selection Screen Coming Soon!')),
        ),
        // TODO: Yahan ProfileSelectionScreen() lagana hai
      ),
    );
  }

  // Google se login
  void _googleLogin() {
    // TODO: Yahan Supabase Google auth call hoga
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Profile Selection Screen Coming Soon!')),
        ),
      ),
    );
  }

  // Forgot password dabane pe
  void _forgotPassword() {
    // TODO: Password reset screen banayenge baad mein (UC-3)
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 50),

              // ---- Welcome emoji + title ----
              const Text('👋', style: TextStyle(fontSize: 52)),

              const SizedBox(height: 12),

              Text(
                'Welcome Back!',
                style: AppTextStyles.displayLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(
                'Sign in to continue your\nIslamic learning journey 🌱',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 44),

              // ---- Email field ----
              _buildTextField(
                controller: _emailController,
                hint: 'Email Address',
                icon: Icons.email_rounded,
              ),

              const SizedBox(height: 16),

              // ---- Password field ----
              _buildTextField(
                controller: _passwordController,
                hint: 'Password',
                icon: Icons.lock_rounded,
                isPassword: true,
              ),

              const SizedBox(height: 6),

              // ---- Forgot password link ----
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _forgotPassword,
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // ---- Sign In button ----
              GestureDetector(
                onTap: _login,
                child: Container(
                  width: double.infinity,
                  height: 58,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.large),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Sign In 🚀',
                      style: AppTextStyles.buttonText,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ---- Divider with "OR" ----
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR', style: AppTextStyles.labelSmall),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              // ---- Google button ----
              GestureDetector(
                onTap: _googleLogin,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.large),
                    border: Border.all(
                      color: AppColors.divider,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'G',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4285F4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Continue with Google',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // ---- Don't have account? Sign Up link ----
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUpScreen(),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ---- Reusable text field widget ----
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !_isPasswordVisible,
      style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textDark),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: AppColors.textLight,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
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
      ),
    );
  }
}