import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'features/home_screen/menue/screens/menue_screen.dart';
import 'features/home_screen_provider/main_screen/screen/main_screen_driver.dart';
import 'features/home_screen_provider/menu_vendor/screen/menu_screen.dart';
import 'features/home_screen_provider/notification_vendor/screen/notification.dart';
import 'features/home_screen_provider/order_screen/screen/order_screen.dart';

class FloatingVendor extends StatefulWidget {
  FloatingVendor({super.key});

  @override
  State<FloatingVendor> createState() => _FloatingVendorState();
}

class _FloatingVendorState extends State<FloatingVendor> {
  int _index = 0;

  final List<Widget> _pages = [
    HomeScreenDriver(),
    OrderScreenVendor(),
    NotificationScreenVendor(),
    MenueScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            body: WillPopScope(
                onWillPop: () async {
                  if (_index != 0) {
                    _index = 0;
                    return false;
                  } else {
                    SystemNavigator.pop();
                    return true;
                  }
                },
                child: _pages[_index]),
            bottomNavigationBar: Container(
              color: Colors.transparent,
              child: FloatingNavbar(
                borderRadius: getSize(context) / 4,
                backgroundColor: AppColors.secondPrimary,
                selectedBackgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                items: [
                  FloatingNavbarItem(
                      customWidget: CircleAvatar(
                    radius: getSize(context) / 24,
                    backgroundColor:
                        _index == 0 ? AppColors.white : AppColors.secondPrimary,
                    child: Padding(
                      padding: EdgeInsets.all(_index == 0 ? 6.0 : 3),
                      child: Image.asset(
                        'assets/images/Home.png',
                        width: getSize(context) / 14,
                        height: getSize(context) / 14,
                        color: _index == 0 ? AppColors.primary : null,
                      ),
                    ),
                  )),
                  FloatingNavbarItem(
                      customWidget: CircleAvatar(
                    radius: getSize(context) / 24,
                    backgroundColor:
                        _index == 1 ? AppColors.white : AppColors.secondPrimary,
                    child: Padding(
                      padding: EdgeInsets.all(_index == 1 ? 6.0 : 3),
                      child: Image.asset(
                        'assets/images/catogries.png',
                        width: getSize(context) / 14,
                        height: getSize(context) / 14,
                        color: _index == 1 ? AppColors.primary : null,
                      ),
                    ),
                  )),
                  FloatingNavbarItem(
                      customWidget: CircleAvatar(
                    radius: getSize(context) / 24,
                    backgroundColor:
                        _index == 2 ? AppColors.white : AppColors.secondPrimary,
                    child: Padding(
                      padding: EdgeInsets.all(_index == 2 ? 6.0 : 3),
                      child: Image.asset(
                        'assets/images/notification.png',
                        width: getSize(context) / 14,
                        height: getSize(context) / 14,
                        color: _index == 2 ? AppColors.primary : null,
                      ),
                    ),
                  )),
                  FloatingNavbarItem(
                      customWidget: CircleAvatar(
                    radius: getSize(context) / 24,
                    backgroundColor:
                        _index == 3 ? AppColors.white : AppColors.secondPrimary,
                    child: Padding(
                      padding: EdgeInsets.all(_index == 3 ? 6.0 : 3),
                      child: Image.asset(
                        'assets/images/windows.png',
                        width: getSize(context) / 14,
                        height: getSize(context) / 14,
                        color: _index == 3 ? AppColors.primary : null,
                      ),
                    ),
                  )),
                ],
                onTap: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                currentIndex: _index,
              ),
            )));
  }
}
