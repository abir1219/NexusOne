import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class UpcomingJobCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String address;
  final double width;

  const UpcomingJobCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.address,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.65,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.UPCOMING_BLOCK_COLOR,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/images/upcoming_service.svg",
              width: 24,
              height: 24,
            ),
            SizedBox(width: width * 0.015),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.TEXT_COLOR_WHITE,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateTime,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
