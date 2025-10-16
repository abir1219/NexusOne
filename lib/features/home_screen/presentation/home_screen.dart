import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nexus_one/core/widgets/custom_button_nav.dart';
import 'package:nexus_one/core/widgets/custom_drawer_menu.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_banner.dart';
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
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.BACKGROUND_BLACK,
        statusBarIconBrightness: Brightness.light, // Android → white icons
        statusBarBrightness: Brightness.dark, // iOS → white icons
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppColors.BACKGROUND_BLACK,
        drawer: CustomDrawerMenu.buildCustomDrawerMenu(context, () {
          _scaffoldKey.currentState?.closeDrawer();
        }),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: height * 0.02,
                children: [
                  CustomTopHeader.buildTopHeader(
                    profileName: 'Hi Glenn,',
                    isOnline: true,
                    isNewNotification: true,
                    context: context,
                    onProfileTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming Jobs",
                        style: GoogleFonts.urbanist(
                          fontSize: 30,
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
                  SizedBox(
                    height: 150, // ✅ set a fixed height for horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          // _buildUpcomingContainer(index, height, width),
                      UpcomingJobCard(title: 'Leak detection and repair', dateTime: DateFormat(
                        "MMMM d, yyyy  •  h:mm a",
                      ).format(DateTime.now()), address: '123 Main Street, Springfield, IL 62701, USA', width: width,),
                    ),
                  ),
                  CustomBanner(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomButtonNav(pageIndex: 0),
      ),
    );
  }
}
