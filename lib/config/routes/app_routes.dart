import 'package:adpay/features/home_screen/screen/home_screen.dart';
import 'package:adpay/features/home_screen_driver/screen/home_screen_driver.dart';
import 'package:flutter/material.dart';
import 'package:adpay/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/choose_login/screen/choose_login_screen.dart';
import '../../features/login/screen/login_screen.dart';
import '../../features/on_boarding/screen/onboarding_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String homeRouteDriver = '/homescreendriver';
  static const String onboarding = '/onboardinscreen';
  static const String choosLogin = '/choosLoginscreen';
//   static const String otpRoute = '/otp';
//   static const String notificationDetailsRoute = '/notificationDetails';
//   static const String registerScreenRoute = '/registerScreen';
//   static const String otpScreenRoute = '/otpScreen';
//   static const String verificationScreenRoute = '/verificationScreen';
//   static const String googleMapScreenRoute = '/googleMapScreen';
//   static const String favoriteRoute = '/favorite';
//   static const String fullScreenImageRoute = '/fullScreenImageRoute';
//   static const String editProfileRoute = '/editProfile';
//   static const String allServicesRoute = '/allServices';
//   static const String privacyRoute = '/privacy_about';
//   static const String myPostsRoute = '/my_posts';
//   static const String detailsRoute = '/details';
//   static const String contactUsRoute = '/contact_us';
//   static const String googleMapDetailsRoute = '/google_map_details_screen';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.homeRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: HomeScreen(),
        );
      case Routes.homeRouteDriver:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: HomeScreenDriver(),
        );
      case Routes.onboarding:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: OnBoardinScreen(),
        );
      case Routes.loginRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: LoginScreen(),
        );
      case Routes.choosLogin:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ChooseloginScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
