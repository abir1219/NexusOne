import 'package:go_router/go_router.dart';

import '../features/on_boarding_screen/presentation/on_boarding_screen.dart';
import '../features/registration_screen/presentation/registration_screen.dart';
import '../features/splash_screen/presentation/splash_screen.dart';
import '../main.dart';
import 'app_pages.dart';

class AppRouters {
  // final bool? isConnected;
  //
  // AppRouters(this.isConnected);

  static GoRouter createRouter() {
    return GoRouter(
      navigatorKey: navigatorKey,
      // initialLocation: AppPages.SPLASH_SCREEN,
      routes: [
        GoRoute(
          path: AppPages.SPLASH_SCREEN,
          builder: (context, state) {
            return SplashScreen();
          },
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
          path: AppPages.ON_BOARDING_SCREEN,
          builder: (context, state) {
            return OnBoardingScreen();
          },
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
        GoRoute(
          path: AppPages.REGISTRATION_SCREEN,
          builder: (context, state) {
            return RegistrationScreen();
          },
          // builder: (BuildContext context, GoRouterState state) =>
          //     const SplashScreen(),
        ),
      ],
    );
  }
}