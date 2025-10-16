import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomScheduleJobDetailsCard extends StatelessWidget {
  const CustomScheduleJobDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
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
                    child: SvgPicture.asset("assets/images/schedule_job.svg"),
                  ),
                  SizedBox(
                    child: Text("Scheduled Jobs",style: GoogleFonts.urbanist(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: AppColors.TEXT_COLOR_WHITE,
                    ),),
                  ),
                  SizedBox(
                    child: Text("Stay prepared for your scheduled tasks",style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                    ),),
                  ),
                ],
              ),
            ),
            Text("5 Scheduled Jobs",style: GoogleFonts.urbanist(
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
