import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> image = [
    "on_boarding_one.png",
    "on_boarding_two.png",
    "on_boarding_three.png",
  ];

  List<String> title = [
    "Deliver Quality Work with Confidence",
    "Save Hundreds of Hours with our Core Features",
    "Get the Job Done Right, Every Time",
  ];

  List<String> subtitle = [
    "Streamline your projects and grow your contracting business.",
    "Efficiency made easy with tools designed for you.",
    "Your satisfaction is our guarantee.",
  ];

  void _nextPage() {
    if (_currentPage < image.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint("✅ Onboarding Completed — Navigate to Home/Login");
      // TODO: Navigate to next screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_BLACK,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // PageView
            PageView.builder(
              controller: _pageController,
              itemCount: image.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                return onBoardingSlide(
                  context: context,
                  imgUrl: image[index],
                  title: title[index],
                  subtitle: subtitle[index],
                );
              },
            ),
            Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  debugPrint("⏩ Skipped");
                  // TODO: Skip to main screen
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height / 2.8, //100
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dots Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      image.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.DOT_ACTIVE
                              : AppColors.DOT_INACTIVE,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height / 20,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Next Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withAlpha(25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size.fromHeight(56),
                      ),
                      child: Text(
                        _currentPage == image.length - 1
                            ? "Get Started"
                            : "Next",
                        style: GoogleFonts.urbanist(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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

  Widget onBoardingSlide({
    required BuildContext context,
    required String imgUrl,
    required String title,
    required String subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        // const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset("assets/images/$imgUrl", fit: BoxFit.contain),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              // height: 1.3,
            ),
          ),
        ),
        // const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              // height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
