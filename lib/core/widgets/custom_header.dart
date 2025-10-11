import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomHeader {
  static Widget buildHeader(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: MediaQuery.sizeOf(context).height * 0.01,
      children: [
        SizedBox(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
        ),
        Gap(MediaQuery.sizeOf(context).height * 0.01),
        Text(
          title,
          style: GoogleFonts.urbanist(
            fontWeight: FontWeight.bold,
            color: AppColors.TEXT_COLOR_WHITE,
            fontSize: 28,
          ),
        ),
        // const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.urbanist(
            color: AppColors.TEXT_COLOR_OFF_WHITE,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
