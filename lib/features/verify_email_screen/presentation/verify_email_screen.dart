import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_header.dart';
import '../../../router/app_pages.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                CustomHeader.buildHeader(
                  context,
                  'Verify Your Email',
                  'We’ve sent a 4-digit verification code to your email address. Please enter it below to verify your account.',
                ),
                const SizedBox(height: 8),
                SizedBox(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '•',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v == null || v.length < 4) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 50,
                          fieldWidth: 50,
                          inactiveColor: Colors.white24,
                          inactiveFillColor: Colors.transparent,
                          activeColor: Colors.white,
                          activeFillColor: Colors.transparent,
                          selectedColor: Colors.white,
                          selectedFillColor: Colors.transparent,
                          borderWidth: 1.5,
                        ),
                        cursorColor: Colors.white,
                        animationDuration: const Duration(milliseconds: 200),
                        enableActiveFill: false,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        onCompleted: (v) {
                          debugPrint("Completed OTP: $v");
                        },
                        onChanged: (value) {
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "OTP will expire in 10 minutes.",
                  style: GoogleFonts.urbanist(
                    color: AppColors.TEXT_COLOR_OFF_WHITE,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomButton.buildCustomButton(
                    () => context.go(AppPages.RESET_PASSWORD_SCREEN),
                    "Verify & Continue",
                  ),
                ),
                const SizedBox(height: 8),
                _buildSignUpLink()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Text.rich(
      TextSpan(
        text: "Resend Code ",
        style: GoogleFonts.urbanist(
          color: AppColors.TEXT_COLOR_WHITE,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: AppColors.TEXT_COLOR_WHITE,
            decorationThickness: 1.0,
          fontSize: 16
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            // Navigate to another page

          },
        children: [
          TextSpan(
            text: "(Active after 30s)",
            style: GoogleFonts.urbanist(
              color: AppColors.TEXT_COLOR_OFF_WHITE,
              fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}
