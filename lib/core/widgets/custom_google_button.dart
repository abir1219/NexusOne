import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomGoogleButton{
  static Widget buildCustomGoogleButton(
      BuildContext context,
      String text,
      Function() onPressed,
      ){
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => onPressed,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 8),
        width: MediaQuery.sizeOf(context).width, //double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.06, //56,
        decoration: BoxDecoration(
          color: AppColors.BUTTON_COLOR,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            SvgPicture.asset(
              'assets/images/google.svg',
              // Make sure to add Google icon to your assets
              width: 24,
              height: 24,
            ),
            Text(
              text,
              style: GoogleFonts.urbanist(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.TEXT_COLOR_WHITE,
              ),
            ),
          ],
        ),

        /*OutlinedButton.icon(
          onPressed: () {
            // Handle Google sign up
          },
          icon: SvgPicture.asset(
            'assets/images/google.svg',
            // Make sure to add Google icon to your assets
            width: 24,
            height: 24,
          ),
          label: Text(
            'Sign Up with Google',
            style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.TEXT_COLOR_WHITE,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: Colors.grey[300]!),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),*/
      ),
    );
  }
}