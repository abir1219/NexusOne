import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_one/core/constants/app_colors.dart';
import 'package:nexus_one/core/widgets/custom_icon_button.dart';
import 'package:nexus_one/router/app_pages.dart';

class CustomButtonNav extends StatefulWidget {
  final int pageIndex;

  const CustomButtonNav({super.key, required this.pageIndex});

  @override
  State<CustomButtonNav> createState() => _CustomButtonNavState();
}

class _CustomButtonNavState extends State<CustomButtonNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.BUTTON_COLOR,
        borderRadius: BorderRadius.circular(32), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton.buildCustomIconButton(
              color: widget.pageIndex == 0
                  ? AppColors.TEXT_COLOR_WHITE
                  : AppColors.TEXT_COLOR_OFF_WHITE,
              function: () {},
              imageUrl: "assets/images/home.png",
            ),
            CustomIconButton.buildCustomIconButton(
              color: widget.pageIndex == 1
                  ? AppColors.TEXT_COLOR_WHITE
                  : AppColors.TEXT_COLOR_OFF_WHITE,
              function: () {},
              imageUrl: "assets/images/jobs.png",
            ),
            CustomIconButton.buildCustomIconButton(
              color: widget.pageIndex == 2
                  ? AppColors.TEXT_COLOR_WHITE
                  : AppColors.TEXT_COLOR_OFF_WHITE,
              function: () {},
              imageUrl: "assets/images/inventory.png",
            ),
            CustomIconButton.buildCustomIconButton(
              color: widget.pageIndex == 3
                  ? AppColors.TEXT_COLOR_WHITE
                  : AppColors.TEXT_COLOR_OFF_WHITE,
              function: () {},
              imageUrl: "assets/images/invoice.png",
            ),
            CustomIconButton.buildCustomIconButton(
              color: widget.pageIndex == 4
                  ? AppColors.TEXT_COLOR_WHITE
                  : AppColors.TEXT_COLOR_OFF_WHITE,
              function: () {},
              imageUrl: "assets/images/account.png",
            ),
          ],
        ),
      ),
    );
  }
}
