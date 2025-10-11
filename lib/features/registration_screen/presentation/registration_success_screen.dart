import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_one/core/constants/app_colors.dart';
import 'package:nexus_one/router/app_pages.dart';

import '../../../core/widgets/custom_success.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.BACKGROUND_BLACK,
        statusBarIconBrightness: Brightness.light, // Android → white icons
        statusBarBrightness: Brightness.dark, // iOS → white icons
      ),
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND_BLACK,
        body: SafeArea(
          child: CustomSuccess.buildCustomSuccess(
            'registration_successful_icon',
            'Account created successfully!',
            'Welcome aboard! Your account is ready — let’s set things up.',
            'Login Now', () => context.go(AppPages.LOGIN_SCREEN),
          ),
        ),
      ),
    );
  }
}
