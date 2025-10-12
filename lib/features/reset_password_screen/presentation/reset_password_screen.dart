import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_one/router/app_pages.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_header.dart';
import '../../../core/widgets/custom_textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                CustomHeader.buildHeader(
                  context,
                  'Reset Your Password',
                  'Create a new password for your account. Make sure it’s strong and easy for you to remember.',
                ),
                const SizedBox(height: 8),
                _buildFormFields(),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomButton.buildCustomButton(
                    color: AppColors.BUTTON_COLOR_01,
                    () => context.go(AppPages.RESET_PASSWORD_SUCCESS_SCREEN),
                    "Reset Password",
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomButton.buildCustomButton(
                    () => context.go(AppPages.LOGIN_SCREEN),
                    "Back to Login",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      spacing: 16,
      children: [
        CustomTextField.buildTextField(
          controller: _passwordController,
          hintText: 'enter new password...',
          label: 'New Password*',
          isPassword: true,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
        CustomTextField.buildTextField(
          controller: _confirmPasswordController,
          hintText: 're-enter new password...',
          label: 'Confirm Password*',
          isPassword: true,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
