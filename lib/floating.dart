import 'dart:io';

import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';

import 'features/home_screen/main_screen/screens/home_screen_user.dart';
import 'features/home_screen/menue/screens/menue_screen.dart';
import 'features/home_screen/orders/screen/oreders_screen.dart';
import 'features/home_screen/presentation/salla.dart';

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

class floating extends StatefulWidget {
  floating({super.key});

  @override
  State<floating> createState() => _floatingState();
}

class _floatingState extends State<floating> {
  int _index = 0;

  final List<Widget> _pages = [
    HomeScreen(), // Your home screen
    OrderScreen(), // Your orders screen
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
              width: getSize(context) / 12,
              child: FloatingNavbar(
                borderRadius: 50,
                backgroundColor: AppColors.secondPrimary,
                // selectedItemColor: purpleColor,
                // unselectedItemColor: purpleColor,
                selectedBackgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.all(Platform.isIOS ? 0 : 1),
                margin: EdgeInsets.zero,
                items: [
                  FloatingNavbarItem(
                      customWidget: _index == 0
                          ?  Image.asset(
                        'assets/images/Home2.png',
                        width: getSize(context) / 12,
                      )
                     : Image.asset(
                              'assets/images/Home.png',
                              width: getSize(context) / 12,
                            )

                     ),
                  FloatingNavbarItem(
                      customWidget: _index == 1?Image.asset(
                      'assets/images/catogries2.png',
                      width: getSize(context) / 12,
                  ): Image.asset(
                        'assets/images/catogries.png',                    width: getSize(context) / 12,
                      )
                  ),
                  FloatingNavbarItem(
                      customWidget:  _index == 2? Image.asset(
                        'assets/images/cart2.png',
                        width: getSize(context) / 12,
                      ):Image.asset(
                  'assets/images/cart.png',                    width: getSize(context) / 12,
    )
                  ),
                  FloatingNavbarItem(
                      customWidget: _index == 3?
                    Image.asset(
                        'assets/images/windows2.png',
                        width: getSize(context) / 12,
                      ):  Image.asset(
                        'assets/images/windows.png',                    width: getSize(context) / 12,
                      ),),
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
