import 'package:adpay/core/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    debugPrint('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('go!');
    _getStoreUser();
  }

  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('onBoarding') == true) {
      if (prefs.getString('user') != null) {
        Preferences.instance.getUserModel().then((value) {
          if (value.data!.type == 'user' ) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.floatingRote,
              (route) => false,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRouteDriver,
              (route) => false,
            );
          }
        });
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.choosLogin,
          ModalRoute.withName(
            Routes.initialRoute,
          ),
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.onboarding,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        bottomSheet: Container(
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: Image.asset(ImageAssets.topBbusiness,
              width: getSize(context) / 3),
        ),
        body: Center(
          child: Image.asset(ImageAssets.logoImage,
              width: getSize(context) / 1.5, height: getSize(context) / 2),
        ));
  }
}
