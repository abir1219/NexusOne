import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexus_one/core/widgets/custom_button_nav.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_top_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.BACKGROUND_BLACK,
        statusBarIconBrightness: Brightness.light, // Android → white icons
        statusBarBrightness: Brightness.dark, // iOS → white icons
      ),
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND_BLACK,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTopHeader.buildTopHeader(
                    profileName: 'Hi Glenn,',
                    isOnline: true,
                    isNewNotification: true,
                  ),
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
