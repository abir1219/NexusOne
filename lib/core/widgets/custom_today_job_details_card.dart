import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomJobDetailsCard extends StatelessWidget {
  const CustomJobDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.sizeOf(context).height * 0.18,//170,
      decoration: BoxDecoration(
        color: AppColors.UPCOMING_BLOCK_COLOR,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  SizedBox(
                    child: SvgPicture.asset("assets/images/group.svg"),
                  ),
                  SizedBox(
                    child: Text("Today’s Jobs",style: GoogleFonts.urbanist(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: AppColors.TEXT_COLOR_WHITE,
                    ),),
                  ),
                  SizedBox(
                    child: Text("Here’s what’s on your schedule today",style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                    ),),
                  ),
                ],
              ),
            ),
            Text("3 Jobs",style: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.TEXT_COLOR_OFF_WHITE,
            ),),
          ],
        ),
      ),
    );
  }
}
