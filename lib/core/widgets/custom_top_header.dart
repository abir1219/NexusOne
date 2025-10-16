import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexus_one/core/constants/app_colors.dart';

class CustomTopHeader {
  static Widget buildTopHeader({
    required String profileName,
    required BuildContext context,
    required bool isOnline,
    required bool isNewNotification,
    required VoidCallback? onProfileTap,
  }) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                splashColor: AppColors.TRANSPARENT_COLOR,
                onTap: onProfileTap,
                child: Stack(
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                    Visibility(
                      visible: isOnline,
                      child: Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.TEXT_COLOR_WHITE,
                              width: 1,
                            ),
                            color: AppColors.ACTIVE_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10),
              Text(
                profileName,
                style: GoogleFonts.urbanist(
                  color: AppColors.TEXT_COLOR_WHITE,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset("assets/images/notifications.svg"),
                  Visibility(
                    visible: isOnline,
                    child: Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.TEXT_COLOR_WHITE,
                            width: 1,
                          ),
                          color: AppColors.ACTIVE_COLOR,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(MediaQuery.sizeOf(context).width * 0.04),
              SvgPicture.asset("assets/images/search.svg"),
            ],
          ),
        ],
      ),
    );
  }
}
