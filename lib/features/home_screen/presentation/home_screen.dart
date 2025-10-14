import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexus_one/core/widgets/custom_button_nav.dart';

import '../../../core/constants/app_colors.dart';

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
        statusBarBrightness: Brightness.dark,      // iOS → white icons
      ),
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND_BLACK,
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        ],)),
        bottomNavigationBar: CustomButtonNav(pageIndex: 0),
      ),
    );
  }
}
