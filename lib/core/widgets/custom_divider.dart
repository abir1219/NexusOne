import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomDivider{
  static buildCustomDivider(){
    return Row(
      children: [
        Expanded(
          child: Divider(color: AppColors.TEXT_COLOR_OFF_WHITE, thickness: 0.4),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or',
            style: GoogleFonts.urbanist(
              color: AppColors.TEXT_COLOR_OFF_WHITE,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: AppColors.TEXT_COLOR_OFF_WHITE, thickness: 0.4),
        ),
      ],
    );
  }
}