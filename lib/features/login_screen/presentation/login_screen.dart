import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_divider.dart';
import '../../../core/widgets/custom_google_button.dart';
import '../../../core/widgets/custom_header.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../router/app_pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isChecked = false;

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  CustomHeader.buildHeader(
                    context,
                    'Welcome Back!',
                    'Sign in to continue your experience. Access your account and manage everything easily.',
                  ),
                  CustomGoogleButton.buildCustomGoogleButton(
                    context,
                    'Login with Google',
                    () {},
                  ),
                  CustomDivider.buildCustomDivider(),
                  _buildFormFields(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () => setState(() => isChecked = !isChecked),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: isChecked,
                                onChanged: (value) => setState(() => isChecked = value!),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: WidgetStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                    color: AppColors.TEXT_COLOR_OFF_WHITE,
                                    width: 0.8,
                                  ),
                                ),
                                checkColor: AppColors.TEXT_COLOR_WHITE,
                                activeColor: AppColors.BACKGROUND_BLACK,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Remember Me',
                              style: GoogleFonts.urbanist(
                                fontSize: 14,
                                color: AppColors.TEXT_COLOR_WHITE,
                                fontWeight: FontWeight.w400,
                                height: 1.6,
                                // height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () => context.go(AppPages.FORGOT_PASSWORD_SCREEN),
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.TEXT_COLOR_WHITE
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CustomButton.buildCustomButton(() => context.go(AppPages.HOME_SCREEN), "Login"),
                  ),
                  const SizedBox(height: 8),
                  _buildSignUpLink(),
                ],
              ),
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
        CustomTextField.buildTextFieldWithLabel(
          context: context,
          controller: _emailController,
          hintText: 'enter your email address...',
          label: 'Email ID*',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        CustomTextField.buildTextFieldWithLabel(
          context: context,
          controller: _passwordController,
          hintText: 'create a strong password...',
          label: 'Password*',
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

  Widget _buildSignUpLink() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Didn’t have an account? ',
        style: GoogleFonts.urbanist(
          color: AppColors.TEXT_COLOR_OFF_WHITE,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: 'Sign up',
            style: GoogleFonts.urbanist(
              color: AppColors.TEXT_COLOR_WHITE,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationThickness: 1.0,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.go(AppPages.REGISTRATION_SCREEN);
                // 👉 Navigate to login screen here
                debugPrint('Login tapped');
              },
          ),
        ],
      ),
    );
  }
}
