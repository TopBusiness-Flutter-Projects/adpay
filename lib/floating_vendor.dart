import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
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
    MenuScreenVendor()
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
                      customWidget: Padding(
                    padding: EdgeInsets.all(2),
                    child: _index == 0
                        ? Image.asset(
                            'assets/images/Home2.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          )
                        : Image.asset(
                            'assets/images/Home.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          ),
                  )),
                  FloatingNavbarItem(
                      customWidget: Padding(
                    padding: EdgeInsets.all(2),
                    child: _index == 1
                        ? Image.asset(
                            'assets/images/catogries2.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          )
                        : Image.asset(
                            'assets/images/catogries.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          ),
                  )),
                  FloatingNavbarItem(
                      customWidget: Padding(
                    padding: EdgeInsets.all(2),
                    child: _index == 2
                        ? Image.asset(
                            'assets/images/cart2.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          )
                        : Image.asset(
                            'assets/images/cart.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          ),
                  )),
                  FloatingNavbarItem(
                      customWidget: Padding(
                    padding: EdgeInsets.all(2),
                    child: _index == 3
                        ? Image.asset(
                            'assets/images/windows2.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                          )
                        : Image.asset(
                            'assets/images/windows.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
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
