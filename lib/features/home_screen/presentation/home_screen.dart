import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nexus_one/core/widgets/custom_button_nav.dart';
import 'package:nexus_one/core/widgets/custom_drawer_menu.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_banner.dart';
import '../../../core/widgets/custom_schedule_job_details_card.dart';
import '../../../core/widgets/custom_today_job_details_card.dart';
import '../../../core/widgets/custom_top_header.dart';
import '../../../core/widgets/custom_upcoming_job_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.BACKGROUND_BLACK,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.BACKGROUND_BLACK,
        drawer: CustomDrawerMenu.buildCustomDrawerMenu(context, () {
          _scaffoldKey.currentState?.closeDrawer();
        }),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Top Header
                CustomTopHeader.buildTopHeader(
                  profileName: 'Hi Glenn,',
                  isOnline: true,
                  isNewNotification: true,
                  context: context,
                  onProfileTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),

                const SizedBox(height: 10),

                // 🔹 Upcoming Jobs Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Jobs",
                      style: GoogleFonts.urbanist(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.TEXT_COLOR_WHITE,
                      ),
                    ),
                    Text(
                      "View All",
                      style: GoogleFonts.urbanist(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.TEXT_COLOR_OFF_WHITE,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // 🔹 Horizontal Job Cards
                SizedBox(
                  height: height * 0.17,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    // padding: const EdgeInsets.only(right: 4),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                      child: UpcomingJobCard(
                        title: 'Leak detection and repair',
                        dateTime: DateFormat(
                          "MMMM d, yyyy  •  h:mm a",
                        ).format(DateTime.now()),
                        address: '123 Main Street, Springfield, IL 62701, USA',
                        width: width,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // 🔹 Banner
                const CustomBanner(),

                const SizedBox(height: 10),

                // 🔹 Job Details Card
                const CustomJobDetailsCard(),

                const SizedBox(height: 10),

                // 🔹 Invoices and Inventory Row
                Row(
                  spacing: 2,
                  children: [
                    Expanded(
                      child: _buildContainer(
                        imageUrl: 'assets/images/invoice.svg',
                        title: 'Invoices',
                        subtitle: 'View and manage all your invoices',
                        qtyStatus: '2 Unpaid',
                        priceStatus: "(\$450.00)",
                      ),
                    ),
                    Expanded(
                      child: _buildContainer(
                        imageUrl: 'assets/images/inventory.svg',
                        title: 'Inventory',
                        subtitle: 'Monitor your product quantities and status',
                        qtyStatus: '4 Items',
                        priceStatus: "Below Stock",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // 🔹 Scheduled Job Details
                const CustomScheduleJobDetailsCard(),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomButtonNav(pageIndex: 0),
      ),
    );
  }

  // 🔹 Reusable Container Card (Invoices / Inventory)
  Widget _buildContainer({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String qtyStatus,
    required String priceStatus,
  }) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.UPCOMING_BLOCK_COLOR,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Top Row: Icon + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(imageUrl, height: 40, width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    qtyStatus,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                    ),
                  ),
                  Text(
                    priceStatus,
                    style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.TEXT_COLOR_OFF_WHITE,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 🔹 Title and Subtitle
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
            subtitle,
            style: GoogleFonts.urbanist(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: AppColors.TEXT_COLOR_OFF_WHITE,
            ),
          ),
        ],
      ),
    );
  }
}
