import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_one/core/constants/app_colors.dart';
import 'package:nexus_one/router/app_pages.dart';

import '../../../core/widgets/custom_success.dart';
class ResetPasswordSuccessScreen extends StatelessWidget {
  const ResetPasswordSuccessScreen({super.key});

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
            'password_reset_successful_icon',
            'Password Reset successfully!',
            'Your password has been updated. You can now log in with your new password.',
            'Back to Login', () => context.go(AppPages.LOGIN_SCREEN),
          ),
        ),
      ),
    );
  }
}
