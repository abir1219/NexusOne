import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import 'custom_button.dart';

class CustomSuccess {
  static Widget buildCustomSuccess(
    String iconName,
    String title,
    String subTitle,
    String btnName,
    void Function() function,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/$iconName.svg'),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w600,
              color: AppColors.TEXT_COLOR_WHITE,
              fontSize: 30,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w400,
              color: AppColors.TEXT_COLOR_OFF_WHITE,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomButton.buildCustomButton(() => function(), btnName),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
