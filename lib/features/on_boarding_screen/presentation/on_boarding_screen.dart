import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/core/widgets/custom_button.dart';
import 'package:nexus_one/router/app_pages.dart';

import '../../../core/constants/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = [
    "on_boarding_one.png",
    "on_boarding_two.png",
    "on_boarding_three.png",
  ];

  final List<String> titles = [
    "Deliver Quality Work with Confidence",
    "Save Hundreds of Hours with our Core Features",
    "Get the Job Done Right, Every Time",
  ];

  final List<String> subtitles = [
    "Streamline your projects and grow your contracting business.",
    "Efficiency made easy with tools designed for you.",
    "Your satisfaction is our guarantee.",
  ];

  void _nextPage() {
    if (_currentPage < images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppPages.REGISTRATION_SCREEN);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    // final width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND_BLACK,
        body: SafeArea(
          child: Stack(
            children: [
              /// Fullscreen PageView
              Positioned.fill(
                top: height * 0.06,//50,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    return _buildOnBoardingSlide(
                      images[index],
                      titles[index],
                      subtitles[index],
                      height,
                    );
                  },
                ),
              ),

              /// Skip button
              Positioned(
                top: 10,
                right: 16,
                child: TextButton(
                  onPressed: () => context.go(AppPages.REGISTRATION_SCREEN),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Skip",
                        style: TextStyle(
                          color: AppColors.TEXT_COLOR_OFF_WHITE,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.TEXT_COLOR_OFF_WHITE,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),

              /// Dots indicator
              Positioned(
                bottom: height * 0.32,//0.38,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 4,
                      width: _currentPage == index ? 50 : 25,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? AppColors.DOT_ACTIVE
                            : AppColors.DOT_INACTIVE,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),

              /// Next Button
              Positioned(
                bottom: height * 0.05,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: CustomButton.buildCustomButton(
                    _nextPage,
                    _currentPage == images.length - 1
                        ? "Get Started"
                        : "Next",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnBoardingSlide(
      String imgUrl,
      String title,
      String subtitle,
      double height,
      ) {
    return Column(
      children: [
        /// Top Image with gradient overlay
        SizedBox(
          height: height * 0.6,
          width: double.infinity,
          child: Stack(
            //fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/images/$imgUrl",
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    AppColors.TRANSPARENT_COLOR,
                      AppColors.BACKGROUND_BLACK.withAlpha(85),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          ),
        ),

        //const SizedBox(height: 20),

        /// Text Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: AppColors.TEXT_COLOR_WHITE,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: AppColors.TEXT_COLOR_OFF_WHITE,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
