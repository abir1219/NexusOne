import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button_nav.dart';
import '../../../core/widgets/custom_jobs_filter.dart';
import '../../../core/widgets/custom_top_header.dart';
import '../../job_list_view_screen/presentation/job_list_view_screen.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  int selectedIndex = 1;

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
        backgroundColor: AppColors.BACKGROUND_BLACK,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              spacing: height * 0.02,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTopHeader.buildTopHeader(
                  profileName: 'Hi Glenn,',
                  isOnline: true,
                  isNewNotification: true,
                  context: context,
                  onProfileTap: () {},
                ),
                CustomJobsFilter.buildJobsFilter(
                  selectedIndex: selectedIndex,
                  function: (newIndex) {
                    setState(() {
                      selectedIndex = newIndex;
                    });
                    debugPrint("selectedIndex → $newIndex");
                  },
                ),
                if(selectedIndex == 1)
                  JobListViewScreen()
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomButtonNav(pageIndex: 1),
      ),
    );
  }
}
