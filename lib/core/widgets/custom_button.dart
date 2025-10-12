import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomButton {
  static Widget buildCustomButton(
    void Function() function,
    String btnTitle, {
    Color color = AppColors.BUTTON_COLOR,
  }) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        //AppColors.BUTTON_COLOR,//Colors.white.withAlpha(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: const Size.fromHeight(56),
      ),
      child: Text(
        btnTitle,
        style: GoogleFonts.urbanist(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
