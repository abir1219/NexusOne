import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomJobsFilter {
  static Widget buildJobsFilter({
    required int selectedIndex,
    required void Function(int selectedIndex) function,
  }) {
    debugPrint("SelectedIndex-->$selectedIndex");
    return Row(
      children: [
        Expanded(
          child: Text(
            "Jobs",
            style: GoogleFonts.urbanist(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: AppColors.TEXT_COLOR_WHITE,
            ),
          ),
        ),
        Row(
          spacing: 6,
          children: [
            _buildFilterContainer(
              index: 1,
              imageIcon: 'job_list_view',
              func: function,
              isClicked: selectedIndex == 1,
            ),
            _buildFilterContainer(
              index: 2,
              imageIcon: 'job_calender_view',
              func: function,
              isClicked: selectedIndex == 2,
            ),
            _buildFilterContainer(
              index: 3,
              imageIcon: 'filter',
              func: function,
              isClicked: selectedIndex == 3,
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildFilterContainer({
    required int index,
    required String imageIcon,
    required void Function(int) func,
    required bool isClicked,
  }) {
    debugPrint("IsClicked-->$isClicked");
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => func(index),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.UPCOMING_BLOCK_COLOR,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/$imageIcon.svg',
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
              isClicked
                  ? AppColors.TEXT_COLOR_WHITE
                  : AppColors.TEXT_COLOR_OFF_WHITE,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
