import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/router/app_pages.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/local/shared_preferences_helper.dart';
import '../../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _initializer();
    // redirect();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      // backgroundColor: AppColors.BACKGROUND_BLACK,
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.BACKGROUND_LIGHT_BLACK,
                AppColors.BACKGROUND_BLACK,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: size.height * 0.01,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      child: SvgPicture.asset(
                        "assets/images/splash_screen_logo.svg",
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        "Hire trusted local pros for any home project.",
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.TEXT_COLOR_WHITE,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              SpinKitCircle(
                color: Colors.white,
                size: 50.0,
                controller: _controller,
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initializer() async {
    //await SharedPreferencesHelper.init();
    redirect();
  }

  void redirect() {
    Future.delayed(
      Duration(milliseconds: 2000),
      () {
        // debugPrint("REDIRECT----->");
        navigatorKey.currentContext!.go(AppPages.ON_BOARDING_SCREEN);
      },
    );
  }
}
