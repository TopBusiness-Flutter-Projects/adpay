import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/menue/myprofile/edit_profile/edit_profile.dart';
import 'package:adpay/features/home_screen/menue/myprofile/edit_profile/screen/user_signup.dart';
import 'package:adpay/features/home_screen/menue/myprofile/harag_details/screens/my_harag_details.dart';
import 'package:adpay/features/home_screen/menue/screens/favourite/favoutite_screen.dart';
import 'package:adpay/features/home_screen/messgaes/screens/messages.dart';
import 'package:adpay/features/home_screen/presentation/chatpage.dart';
import 'package:adpay/features/home_screen/presentation/complete_order.dart';
import 'package:flutter/material.dart';
import 'package:adpay/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../core/utils/app_strings.dart';
import '../../features/choose_login/screen/choose_login_screen.dart';
import '../../features/forget_password/screen/forget_pass.dart';
import '../../features/forget_password/screen/newpass.dart';
import '../../features/home_screen/add_harag/screens/add_harag.dart';
import '../../features/home_screen/advertisment/screen/advertisment_screen.dart';
import '../../features/home_screen/best_seller/screens/best_seller_screen.dart';
import '../../features/home_screen/catogries/screens/Categories_screen.dart';
import '../../features/home_screen/garage/screens/grage_screen.dart';
import '../../features/home_screen/grage_details/screen/allcomments_screen.dart';
import '../../features/home_screen/main_screen/screens/home_screen_user.dart';
import '../../features/home_screen/menue/myprofile/edit_my_harag/edit_my_harag.dart';
import '../../features/home_screen/menue/myprofile/myharag/screens/my_harag.dart';
import '../../features/home_screen/menue/myprofile/screens/myprofile.dart';
import '../../features/home_screen/menue/screens/contact_us/screens/contact_us.dart';
import '../../features/home_screen/menue/screens/menue_screen.dart';
import '../../features/home_screen/menue/screens/mypoints/screens/points.dart';
import '../../features/home_screen/menue/screens/places/screens/places.dart';
import '../../features/home_screen/menue/screens/pocket/pocket.dart';
import '../../features/home_screen/notifications/screens/notification_screen.dart';
import '../../features/home_screen/order_details/screens/order_details.dart';
import '../../features/home_screen/presentation/salla.dart';
import '../../features/home_screen/product_details/screens/proudct_details_screen.dart';
import '../../features/home_screen/products/screens/products-screen.dart';
import '../../features/home_screen/shop/screens/theshop_screen.dart';
import '../../features/home_screen/tager/screens/tager_screen.dart';
import '../../features/home_screen_provider/main_screen/screen/ads_vendor_screen.dart';
import '../../features/home_screen_provider/main_screen/screen/main_screen_driver.dart';
import '../../features/home_screen_provider/main_screen/screen/total_products.dart';
import '../../features/home_screen_provider/main_screen/screen/wallet_screen.dart';
import '../../features/home_screen_provider/order_screen/screen/order_details.dart';
import '../../features/home_screen_provider/order_screen/screen/order_screen.dart';
import '../../features/login/screen/login_screen.dart';
import '../../features/login/screen/otp_verify.dart';
import '../../features/on_boarding/screen/onboarding_screen.dart';
import '../../features/register_user/screen/user_signup.dart';
import '../../features/vendor_sign_up/screen/vendor_sign_up.dart';
import '../../floating.dart';
import '../../floating_vendor.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String CategoriesRoute = '/categories'; // Change this line
  static const String ProductssRoute = '/products';
  static const String ProductsDetails = '/productsDetails'; // Change this line

  static const String float = '/float'; // Change this line

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

  static const String bestSeller = '/BestSeller';
  static const String gragedetails = '/GrageDetails';

  static const String allcomments = '/allcomments';

  static const String chatapp = '/chatapp';
  static const String completeorder = '/compeleteorder';
  static const String salla = '/salla';
  static const String orderDetails = '/orderDetails';
  static const String tagerscreen = '/tagerscreen';
  static const String notificationscreen = '/notification';
  static const String messagescreen = '/message';
  static const String addharag = '/addharag';

  static const String contactus = '/contactus';
  static const String profilescreen = '/profilescreen';

  static const String favouritescreen = '/favouritescreen';
  static const String profile = '/profile';
  static const String pocket = '/pocket';

  static const String points = '/points';

  static const String places = '/places';
  static const String myharag = '/myharag';
  static const String editprofile = '/editprofile';

  static const String myharagdetails = '/myharagdetails';

  static const String editmyharagdetails = '/editmyharagdetails';

  static const String Main = '/Main';
  static const String usersignupscreen = '/usersignupscreen';
  static const String floatVendor = '/floatVendor';
  static const String orderScreenVendor = '/OrderScreenVendor';
  static const String orderDetailsVendor = '/orderDetailsVendor';
  static const String NewPass = '/newpass';
  static const String walletVendorScreen = '/walletVendorScreen';
  static const String totalProductsVendorScreen = '/totalProductsVendorScreen';
  static const String adsVendorScreen = '/adsVendorScreen';
  static const String otpScreen = '/otpScreen';

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
      case Routes.profilescreen: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: MyProfileScreen(), // Replace with your category screen widget
        );
      case Routes.usersignupscreen: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: UserSignUpScreen(), // Replace with your category screen widget
        );
      case Routes.myharag: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: MyHarag(), // Replace with your category screen widget
        );
      case Routes.editmyharagdetails: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child:
              EditMyHaragDetails(), // Replace with your category screen widget
        );
      case Routes.myharagdetails: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: MyHaragDetails(), // Replace with your category screen widget
        );
      case Routes.pocket: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: PocketScreen(), // Replace with your category screen widget
        );
      case Routes.float: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Floating(), // Replace with your category screen widget
        );
      case Routes.floatVendor: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: FloatingVendor(), // Replace with your category screen widget
        );
      case Routes.editprofile: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: EditProfile(), // Replace with your category screen widget
        );
      case Routes.profile: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: MyProfileScreen(), // Replace with your category screen widget
        );
      case Routes.favouritescreen: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: FavouriteScreen(), // Replace with your category screen widget
        );

      case Routes.contactus: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ContactUsScreen(), // Replace with your category screen widget
        );

      case Routes.points: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: MyPoints(), // Replace with your category screen widget
        );
      case Routes.places: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: PlacesScreen(), // Replace with your category screen widget
        );

      case Routes.messagescreen: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: MessageScreen(), // Replace with your category screen widget
        );
      case Routes.notificationscreen: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child:
              NotificationScreen(), // Replace with your category screen widget
        );
      case Routes.orderDetails: // Change this line
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: OrderDetails(), // Replace with your category screen widget
        );
      case Routes.advertisement:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Advertesment_Screen(),
        );
      case Routes.tagerscreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: TagerScreen(),
        );
      case Routes.completeorder:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: CompleteOrder(),
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
          child: Floating(),
        );

      case Routes.ShopRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: Shop_Screen(),
        );
      case Routes.salla:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: SallaScreen(),
        );
      case Routes.bestSeller:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: BestSellerScreen(),
        );
      case Routes.chatapp:
        String? id = settings.arguments as String?;
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ChatPageScreen(id:id),
        );
      case Routes.Main:
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

      case Routes.ProductssRoute:
        String? id = settings.arguments as String?;
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ProductsScreen(id: id),
        );
      case Routes.ProductsDetails:
        String? id = settings.arguments as String?;
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: ProductDetailsScreen(id: id),
        );
      case Routes.gragedetails:
        String? id = settings.arguments as String?;

        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: GrageDetailsScreen(id: id),
        );
      case Routes.garageRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: GrageScreen(),
        );
      case Routes.allcomments:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: AllComments(),
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
          child: ForgetPaas(),
        );
      case Routes.addharag:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: AddHarag(),
        );
      case Routes.vendorSignUp:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: VendorSignupScreen(),
        );
      case Routes.orderScreenVendor:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: OrderScreenVendor(),
        );
      case Routes.NewPass:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: NewPass(),
        );
      case Routes.orderDetailsVendor:
        String? id = settings.arguments as String?;

        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: OrderDetailsVendor(id: id),
        );
      case Routes.walletVendorScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: WalletVendorScreen(),
        );
      case Routes.totalProductsVendorScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: TotalProductsVendorScreen(),
        );
      case Routes.adsVendorScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: AdsVendorScreen(),
        );
      case Routes.otpScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 800),
          child: OTPVerifyScreen(),
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
