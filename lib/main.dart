import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/my_app.dart';
import 'core/constants/app_colors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  /*SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.BACKGROUND_BLACK,
    statusBarIconBrightness: Brightness.light, // Android → white icons
    statusBarBrightness: Brightness.dark,       // iOS → white icons
  ));*/
  runApp(const MyApp());
}