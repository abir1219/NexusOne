import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CustomDrawerMenu {
  static Widget buildCustomDrawerMenu(
    BuildContext context,
    VoidCallback? onDrawerClose,
  ) {
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
                      icon: Icon(
                        Icons.close,
                        color: AppColors.TEXT_COLOR_OFF_WHITE,
                        size: 18,
                      ),
                    ),
                  ),
                  // --- Profile Section ---
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Glenn Cross",
                    style: GoogleFonts.urbanist(
                      color: AppColors.TEXT_COLOR_WHITE,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Contractor",
                    style: GoogleFonts.urbanist(
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // --- Drawer Menu Items ---
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        spacing: 10,
                        children: [
                          _buildDrawerItem('assets/images/account.png', "Account"),
                          _buildDrawerItem('assets/images/jobs.png', "Jobs"),
                          _buildDrawerItem(
                            'assets/images/inventory.png',
                            "Inventory",
                          ),
                          _buildDrawerItem('assets/images/invoice.png', "Invoice"),
                          _buildDrawerItem(
                            'assets/images/transaction.png',
                            "Transaction",
                          ),
                          _buildDrawerItem(
                            'assets/images/stock.png',
                            "Stock Forecasting",
                          ),
                          _buildDrawerItem(
                            'assets/images/tax_expense.png',
                            "Tax Expense",
                          ),
                        ],
                      ),
                    ),
                  ),

                  //const Spacer(),
                  // Gap(MediaQuery.sizeOf(context).height * 0.1),

                  // --- Bottom Links ---
                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildBottomLink("About"),
                      _buildBottomLink("Settings"),
                      _buildBottomLink("Terms & Policy"),
                      _buildBottomLink("Disclaimer"),
                      _buildBottomLink("Logout"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * .05,
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

  static Widget _buildDrawerItem(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(imageUrl),
          // Icon(icon, color: AppColors.TEXT_COLOR_WHITE, size: 22),
          const SizedBox(width: 16),
          Text(
            title,
            style: GoogleFonts.urbanist(
              color: AppColors.TEXT_COLOR_WHITE,
              fontSize: 18,
              fontWeight: FontWeight.w600,
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
        style: GoogleFonts.urbanist(
          color: AppColors.TEXT_COLOR_OFF_WHITE,
          fontSize: 18,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
