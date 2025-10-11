import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                onPressed: () {},
                icon: obscureText
                    ? const Icon(Icons.visibility_off_outlined,color: AppColors.TEXT_COLOR_OFF_WHITE,)
                    : Icon(Icons.visibility_outlined,color: AppColors.TEXT_COLOR_OFF_WHITE,),
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
    /*Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: validator,
        ),
      ],
    );*/
  }
}
