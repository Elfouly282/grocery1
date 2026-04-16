import 'package:flutter/material.dart';

import '../../../core/resources/appassets.dart';
import '../domain/entities/onboarding_entity.dart';
import '../widgets/onboarding_dots_indicator.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingEntity> _pages = [
    OnboardingEntity(
      image: AppAssets.undrawEmptyCart,
      title: 'Shop Everything You Need, In One Click',
      description: 'Discover over 1000 fresh and essential grocery products in a single place.',
    ),
    OnboardingEntity(
      image: AppAssets.group,
      title: 'Save Time, Get Groceries Delivered to Your Door',
      description: 'Ultra-fast delivery with real-time tracking straight to you.',
    ),
  ];

  void _onNextPressed() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _onBackPressed() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              // Skip
              if (_currentIndex == 0)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1A3C5E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              // الصفحات
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPageWidget(
                      image: _pages[index].image,
                      title: _pages[index].title,
                      description: _pages[index].description,
                    );
                  },
                ),
              ),

              // Dots
              OnboardingDotsIndicator(
                currentIndex: _currentIndex,
                count: _pages.length,
              ),

              const SizedBox(height: 32),

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    if (_currentIndex > 0)
                      GestureDetector(
                        onTap: _onBackPressed,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 56),

                    // Next button
                    GestureDetector(
                      onTap: _onNextPressed,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1A3C5E),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}