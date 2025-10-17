import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/core/constants/app_colors.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2,//170,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            Image.asset("assets/images/banner.png", fit: BoxFit.cover),
            // Shadow overlay (gradient)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF16191C).withAlpha(50),
                    Color(0xFF0A0D0E),
                    // bottom shadow
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.023, //22
              right: MediaQuery.sizeOf(context).width * 0.050, //20,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xE5232627),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "Explore",
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.TEXT_COLOR_WHITE,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.035,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NEXUS ONE",
                      style: GoogleFonts.urbanist(
                        color: AppColors.TEXT_COLOR_WHITE,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Quality. Reliability. Delivered.",
                      style: GoogleFonts.urbanist(
                        color: AppColors.TEXT_COLOR_WHITE,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
