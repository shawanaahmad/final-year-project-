// ============================================================
// onboarding_screen.dart
// Kids Islamic Hub — 3 intro slides
// App ki features dikhata hai, phir Login screen pe jata hai
// ============================================================

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// Har slide ka data
class _OnboardingPage {
  final String emoji;
  final String title;
  final String subtitle;
  final Color bgColor;

  const _OnboardingPage({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.bgColor,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // PageController — slides ko control karta hai
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Teen onboarding slides
  final List<_OnboardingPage> _pages = const [
    _OnboardingPage(
      emoji: '📖',
      title: 'Learn Tajweed\nthe Fun Way!',
      subtitle: 'Letters, words, aur Quran rules — sab kuch\nbacchon ke liye banaya gaya hai!',
      bgColor: Color(0xFFE8F5E9),
    ),
    _OnboardingPage(
      emoji: '🎤',
      title: 'Record & Get\nSmart Feedback!',
      subtitle: 'Apni awaaz record karo, AI batayega\nkitna acha pada — Stars jeeto! ⭐',
      bgColor: Color(0xFFE3F2FD),
    ),
    _OnboardingPage(
      emoji: '🏆',
      title: 'Learn Duas &\nGood Manners!',
      subtitle: 'Roz ki duas aur Islamic manners\naudio ke saath seekho!',
      bgColor: Color(0xFFFFFDE7),
    ),
  ];

  // Next button dabane pe
  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Aakhri slide pe — Login pe jao
      _goToLogin();
    }
  }

  // Login screen pe navigate karo
  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Login Screen Coming Soon!')),
        ),
        // TODO: Yahan LoginScreen() lagana hai jab woh ban jaye
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pages[_currentPage].bgColor,
      body: SafeArea(
        child: Column(
          children: [

            // ---- Skip button ----
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: TextButton(
                  onPressed: _goToLogin,
                  child: Text(
                    'Skip →',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textMedium,
                    ),
                  ),
                ),
              ),
            ),

            // ---- Slides ----
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _OnboardingSlide(page: _pages[index]);
                },
              ),
            ),

            // ---- Dots + Next button ----
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 20,
              ),
              child: Column(
                children: [

                  // Dot indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                          (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == i ? 28 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _currentPage == i
                              ? AppColors.primary
                              : AppColors.divider,
                          borderRadius: BorderRadius.circular(
                            AppRadius.full,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Next / Get Started button
                  GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: double.infinity,
                      height: 58,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppRadius.large,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          _currentPage == _pages.length - 1
                              ? "Let's Start! 🚀"
                              : 'Next →',
                          style: AppTextStyles.buttonText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Ek slide ka design ----
class _OnboardingSlide extends StatelessWidget {
  final _OnboardingPage page;

  const _OnboardingSlide({required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // Bara emoji circle
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Center(
              child: Text(page.emoji, style: const TextStyle(fontSize: 90)),
            ),
          ),

          const SizedBox(height: 48),

          // Title
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.displayLarge,
          ),

          const SizedBox(height: 16),

          // Subtitle
          Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}