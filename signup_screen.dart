// ============================================================
// signup_screen.dart
// Kids Islamic Hub — Sign Up Screen
// Name, Email, Password + Google Sign-in
// FR-01: Email-password/google sign up
// ============================================================

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Text fields ko control karne ke liye controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Password chhupi rahegi ya dikhegi
  bool _isPasswordVisible = false;

  // Sign Up button dabane pe
  void _signUp() {
    // TODO: Yahan Supabase authentication call hoga
    // Filhal sirf next screen pe jaate hain
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Profile Selection Screen Coming Soon!')),
        ),
        // TODO: Yahan ProfileSelectionScreen() lagana hai
      ),
    );
  }

  // Google se sign up
  void _googleSignUp() {
    // TODO: Yahan Supabase Google auth call hoga
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Profile Selection Screen Coming Soon!')),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Memory free karo
    _nameController.dispose();
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

              const SizedBox(height: 24),

              // ---- Back button ----
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryPale,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ---- Top emoji + title ----
              const Text('🌟', style: TextStyle(fontSize: 52)),

              const SizedBox(height: 12),

              Text(
                'Create Account',
                style: AppTextStyles.displayLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(
                'Join Kids Islamic Hub today!',
                style: AppTextStyles.bodyLarge,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // ---- Name field ----
              _buildTextField(
                controller: _nameController,
                hint: 'Full Name',
                icon: Icons.person_rounded,
              ),

              const SizedBox(height: 16),

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
                hint: 'Password (min 8 characters)',
                icon: Icons.lock_rounded,
                isPassword: true,
              ),

              const SizedBox(height: 8),

              // ---- Password hint ----
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    '✅ Letters aur numbers use karo strong password ke liye',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.success,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ---- Sign Up button ----
              GestureDetector(
                onTap: _signUp,
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
                      'Create Account 🎉',
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
                onTap: _googleSignUp,
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
                        'Sign up with Google',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ---- Already have account? Login link ----
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppTextStyles.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Sign In',
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