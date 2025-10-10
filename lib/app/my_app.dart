import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/app_routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final GoRouter routers = AppRouters.createRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Crown Pro',
      routerDelegate: routers.routerDelegate,
      routeInformationProvider: routers.routeInformationProvider,
      routeInformationParser: routers.routeInformationParser,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}