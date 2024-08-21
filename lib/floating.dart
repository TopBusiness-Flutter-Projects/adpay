import 'dart:io';

import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'features/home_screen/main_screen/screens/home_screen_user.dart';
import 'features/home_screen/menue/screens/menue_screen.dart';
import 'features/home_screen/orders/screen/oreders_screen.dart';
import 'features/home_screen/presentation/salla/presentation/salla.dart';

// class floating extends StatelessWidget {
//   const floating({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FloatingNavBar(
//       resizeToAvoidBottomInset: false,
//       color: AppColors.secondPrimary,
//       selectedIconColor: Colors.white,
//       index: 0, // Index of the "Home" item
//       unselectedIconColor: Colors.white.withOpacity(0.6),
//       items: [
//         FloatingNavBarItem(iconData: Icons.home_outlined, page: HomeScreen(), title: 'home'.tr()),
//
//         FloatingNavBarItem(iconData: Icons.category, page: OrderScreen(), title: 'hello',useImageIcon:true),
//         FloatingNavBarItem(iconData: Icons.shopping_basket, page:SallaScreen(), title: 'Reminders'),
//         FloatingNavBarItem(iconData: Icons.pending_actions_outlined, page: Container(color: Colors.blue), title: 'Records'),
//       ],
//       horizontalPadding: 10.0,
//
//       hapticFeedback: false,
//       showTitle: false,
//     );
//   }
// }
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Floating extends StatefulWidget {
  Floating({super.key});

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  int _index = 0;

  final List<Widget> _pages = [
    HomeScreen(), // Your home screen
    OrderScreen(),
   // Your orders screen
    SallaScreen(), // Your salla screen
    MenueScreen() // Your settings page or any other page
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
              margin: EdgeInsets.all(8),
              child: FloatingNavbar(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.all(3),
                borderRadius: getSize(context) / 4,
                backgroundColor: AppColors.secondPrimary,
                // selectedItemColor: purpleColor,
                // unselectedItemColor: purpleColor,
                selectedBackgroundColor: Colors.transparent,
                elevation: 0,

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
