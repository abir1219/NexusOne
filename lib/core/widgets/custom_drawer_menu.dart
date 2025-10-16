import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';


class CustomDrawerMenu {
  static Widget buildCustomDrawerMenu(BuildContext context,
      VoidCallback? onDrawerClose,) {
    return Stack(
      children: [
        Drawer(
          backgroundColor: AppColors.BACKGROUND_BLACK,
          elevation: 0,
          shadowColor: AppColors.BACKGROUND_LIGHT_BLACK,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      splashColor: AppColors.TRANSPARENT_COLOR,
                      onPressed: onDrawerClose,
                      icon: Icon(Icons.close, color: AppColors.TEXT_COLOR_OFF_WHITE,size: 18,),
                    ),
                  ),
                  // --- Profile Section ---
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Glenn Cross",
                            style: TextStyle(
                              color: AppColors.TEXT_COLOR_WHITE,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Contractor",
                            style: TextStyle(
                              color: AppColors.TEXT_COLOR_OFF_WHITE,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // --- Drawer Menu Items ---
                  _buildDrawerItem(Icons.home_outlined, "Home"),
                  _buildDrawerItem(Icons.work_outline, "Jobs"),
                  _buildDrawerItem(Icons.inventory_2_outlined, "Inventory"),
                  _buildDrawerItem(Icons.receipt_long_outlined, "Invoice"),
                  _buildDrawerItem(Icons.person_outline, "Account"),
                  _buildDrawerItem(Icons.attach_money_outlined, "Transaction"),
                  _buildDrawerItem(Icons.notifications_none_outlined, "Notification"),

                  const Spacer(),
                  // Gap(MediaQuery.sizeOf(context).height * 0.1),

                  // --- Bottom Links ---
                  _buildBottomLink("About"),
                  _buildBottomLink("Settings"),
                  _buildBottomLink("Terms & Policy"),
                  _buildBottomLink("Disclaimer"),
                  _buildBottomLink("Logout"),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * .1,
          right: MediaQuery.sizeOf(context).width * .1,
          child: GestureDetector(
            onTap: () {
              // handle help button tap
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.help_outline,
                color: AppColors.TEXT_COLOR_WHITE,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildDrawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.TEXT_COLOR_WHITE, size: 22),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.TEXT_COLOR_WHITE,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildBottomLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.TEXT_COLOR_OFF_WHITE,
          fontSize: 14,
        ),
      ),
    );
  }
}