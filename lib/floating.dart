import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

import 'features/home_screen/presentation/screen/home_screen_user.dart';

class floating extends StatelessWidget {
  const floating({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      resizeToAvoidBottomInset: false,
      color: AppColors.secondPrimary,
      selectedIconColor: Colors.white,
      index: 0, // Index of the "Home" item
      unselectedIconColor: Colors.white.withOpacity(0.6),
      items: [
        FloatingNavBarItem(iconData: Icons.home_outlined, page: HomeScreen(), title: 'home'.tr()),

        FloatingNavBarItem(iconData: Icons.local_hospital_outlined, page: Container(color: Colors.blue), title: 'hello'),
        FloatingNavBarItem(iconData: Icons.alarm, page: Container(color: Colors.blue), title: 'Reminders'),
        FloatingNavBarItem(iconData: Icons.pending_actions_outlined, page: Container(color: Colors.white60), title: 'Records'),
      ],
      horizontalPadding: 10.0,
      hapticFeedback: true,
      showTitle: true,
    );
  }
}
