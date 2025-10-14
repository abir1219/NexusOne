import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/main.dart';

import '../constants/app_colors.dart';

class CustomTextField {
  static Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
    TextInputType? keyboardType,
    int maxLength = 100,
    bool obscureText = false,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLength: maxLength,
      style: GoogleFonts.urbanist(
        color: Colors.white,
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        counterText: '',
        suffixIcon: isPassword
            ? IconButton(
                splashColor: Colors.transparent,
                onPressed: () {},
                icon: obscureText
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.TEXT_COLOR_OFF_WHITE,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: AppColors.TEXT_COLOR_OFF_WHITE,
                      ),
              )
            : null,
        label: Text(label),
        labelStyle: GoogleFonts.urbanist(
          color: AppColors.TEXT_COLOR_WHITE,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.urbanist(
          color: AppColors.TEXT_COLOR_OFF_WHITE,
          fontStyle: FontStyle.italic,
        ),
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withAlpha(70), width: 1.5),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      cursorColor: Colors.white,
    );
  }

  static Widget buildTextFieldWithLabel({
    required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    required String label,
    TextInputType? keyboardType,
    int maxLength = 100,
    bool obscureText = false,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background container
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(
              // height: 65,
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.BACKGROUND_BLACK,
                //borderSide: BorderSide(color: Colors.white.withAlpha(70), width: 1.5),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: AppColors.TEXT_COLOR_WHITE.withAlpha(70),
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  obscureText: obscureText,
                  maxLength: maxLength,
                  style: GoogleFonts.urbanist(
                    color: AppColors.TEXT_COLOR_WHITE,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: GoogleFonts.urbanist(
                      color: Colors.grey.shade500,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  validator: validator,
                ),
              ),
            ),
          ),

          // Floating label
          Positioned(
            top: 0,
            left: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              color: AppColors.BACKGROUND_BLACK,
              child: Text(
                label,
                style: GoogleFonts.urbanist(
                  color: AppColors.TEXT_COLOR_WHITE,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
