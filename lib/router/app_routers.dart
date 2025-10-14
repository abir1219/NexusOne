import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_one/features/forgot_password_screen/presentation/forgot_password_screen.dart';
import 'package:nexus_one/features/home_screen/presentation/home_screen.dart';
import 'package:nexus_one/features/login_screen/presentation/login_screen.dart';
import 'package:nexus_one/features/reset_password_screen/presentation/reset_password_screen.dart';
import 'package:nexus_one/features/reset_password_screen/presentation/reset_password_success_screen.dart';
import 'package:nexus_one/features/verify_email_screen/presentation/verify_email_screen.dart';
import '../features/on_boarding_screen/presentation/on_boarding_screen.dart';
import '../features/registration_screen/presentation/registration_screen.dart';
import '../features/registration_screen/presentation/registration_success_screen.dart';
import '../features/splash_screen/presentation/splash_screen.dart';
import '../main.dart';
import 'app_pages.dart';

class AppRouters {
  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: navigatorKey,
      routes: [
        _buildRoute(AppPages.SPLASH_SCREEN, const SplashScreen()),
        _buildRoute(AppPages.ON_BOARDING_SCREEN, const OnBoardingScreen()),
        _buildRoute(AppPages.REGISTRATION_SCREEN, const RegistrationScreen()),
        _buildRoute(AppPages.REGISTRATION_SUCCESS_SCREEN, const RegistrationSuccessScreen()),
        _buildRoute(AppPages.LOGIN_SCREEN, const LoginScreen()),
        _buildRoute(AppPages.FORGOT_PASSWORD_SCREEN, const ForgotPasswordScreen()),
        _buildRoute(AppPages.VERIFY_EMAIL_SCREEN, const VerifyEmailScreen()),
        _buildRoute(AppPages.RESET_PASSWORD_SCREEN, const ResetPasswordScreen()),
        _buildRoute(AppPages.RESET_PASSWORD_SUCCESS_SCREEN, const ResetPasswordSuccessScreen()),
        _buildRoute(AppPages.HOME_SCREEN, const HomeScreen()),
      ],
    );
  }

  // Helper method to reduce duplication
  static GoRoute _buildRoute(String path, Widget page) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: page,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    );
  }
}
