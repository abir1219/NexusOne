import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nexus_one/core/constants/app_colors.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.white,
            splashColor: AppColors.TRANSPARENT_COLOR,
            highlightColor: Colors.transparent,
            onPressed: () => context.go(AppPages.HOME_SCREEN),
            icon: Icon(Icons.home_outlined, size: 24),
          ),
          IconButton(
            icon: Icon(Icons.work_outline, size: 24),
            color: Colors.white,
            splashColor: AppColors.TRANSPARENT_COLOR,
            highlightColor: Colors.transparent,
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.archive_outlined, size: 24),
            splashColor: AppColors.TRANSPARENT_COLOR,
            highlightColor: Colors.transparent,
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.receipt_long_outlined, size: 24),
            splashColor: AppColors.TRANSPARENT_COLOR,
            highlightColor: Colors.transparent,
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.person_outline, size: 24),
            splashColor: AppColors.TRANSPARENT_COLOR,
            highlightColor: Colors.transparent,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
