import 'package:adpay/features/home_screen/presentation/screen/grage.dart';
import 'package:flutter/material.dart';
import 'package:adpay/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/choose_login/screen/choose_login_screen.dart';
import '../../features/forget_password/screen/forget_pass.dart';
import '../../features/home_screen/presentation/screen/Categories_screen.dart';
import '../../features/home_screen/presentation/screen/advertisment_screen.dart';
import '../../features/home_screen/presentation/screen/home_screen_user.dart';
import '../../features/home_screen/presentation/screen/products.dart';
import '../../features/home_screen/presentation/screen/theshop.dart';
import '../../features/home_screen_provider/screen/home_screen_driver.dart';
import '../../features/login/screen/login_screen.dart';
import '../../features/on_boarding/screen/onboarding_screen.dart';
import '../../features/vendor_sign_up/screen/vendor_sign_up.dart';
import '../../floating.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String CategoriesRoute = '/categories'; // Change this line
  static const String ProductssRoute = '/products'; // Change this line
  static const String floatingRote = '/floating';
  static const String garageRoute = '/garage'; // Change this line
  static const String ShopRoute = '/shop'; // Change this line
  static const String advertisement = '/advertisement'; // Change this line
  static const String homeRoute = '/home';
  static const String homeRouteDriver = '/homescreendriver';
  static const String onboarding = '/onboardinscreen';
  static const String choosLogin = '/choosLoginscreen';
  static const String forgetPassword = '/forgetPassword';
  static const String vendorSignUp = '/vendorSignUp';
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
      case Routes.CategoriesRoute: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Catogreisss(), // Replace with your category screen widget
        );
      case Routes.advertisement:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Advertesment_Screen(),
        );
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
      case Routes.floatingRote:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: floating(),
        );

      case Routes.ShopRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Shop_Screen(),
        );
      case Routes.homeRouteDriver:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: HomeScreenDriver(),
        );
      case Routes.ProductssRoute:
        String id = settings.arguments as String;

        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ProductsScreen(id:id ,),
        );
      case Routes.garageRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Grage_Screen(),
        );
      case Routes.onboarding:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: OnBoardinScreen(),
        );
      case Routes.loginRoute:
        String id = settings.arguments as String;
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: LoginScreen(id: id),
        );

      case Routes.choosLogin:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ChooseloginScreen(),
        );
      case Routes.forgetPassword:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ForgetPasswordScreen(),
        );

      case Routes.vendorSignUp:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: VendorSignupScreen(),
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
