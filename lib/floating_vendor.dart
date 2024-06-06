import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/cubit.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/state.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/home_screen/menue/screens/menue_screen.dart';
import 'features/home_screen_provider/main_screen/screen/main_screen_driver.dart';
import 'features/home_screen_provider/notification_vendor/screen/notification.dart';
import 'features/home_screen_provider/order_screen/screen/order_screen.dart';

class FloatingVendor extends StatefulWidget {
  FloatingVendor({super.key});

  @override
  State<FloatingVendor> createState() => _FloatingVendorState();
}

class _FloatingVendorState extends State<FloatingVendor> {
  final List<Widget> _pages = [
    HomeScreenDriver(),
    OrderScreenVendor(),
    NotificationScreenVendor(),
    MenueScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();
        return SafeArea(
            top: false,
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                extendBody: true,
                body: WillPopScope(
                    onWillPop: () async {
                      if (cubit.currentIndex != 0) {
                        cubit.currentIndex = 0;
                        return false;
                      } else {
                        SystemNavigator.pop();
                        return true;
                      }
                    },
                    child: _pages[cubit.currentIndex]),
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
                        backgroundColor: cubit.currentIndex == 0
                            ? AppColors.white
                            : AppColors.secondPrimary,
                        child: Padding(
                          padding:
                              EdgeInsets.all(cubit.currentIndex == 0 ? 6.0 : 3),
                          child: Image.asset(
                            'assets/images/Home.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                            color: cubit.currentIndex == 0
                                ? AppColors.primary
                                : null,
                          ),
                        ),
                      )),
                      FloatingNavbarItem(
                          customWidget: CircleAvatar(
                        radius: getSize(context) / 24,
                        backgroundColor: cubit.currentIndex == 1
                            ? AppColors.white
                            : AppColors.secondPrimary,
                        child: Padding(
                          padding:
                              EdgeInsets.all(cubit.currentIndex == 1 ? 6.0 : 3),
                          child: Image.asset(
                            'assets/images/catogries.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                            color: cubit.currentIndex == 1
                                ? AppColors.primary
                                : null,
                          ),
                        ),
                      )),
                      FloatingNavbarItem(
                          customWidget: CircleAvatar(
                        radius: getSize(context) / 24,
                        backgroundColor: cubit.currentIndex == 2
                            ? AppColors.white
                            : AppColors.secondPrimary,
                        child: Padding(
                          padding:
                              EdgeInsets.all(cubit.currentIndex == 2 ? 6.0 : 3),
                          child: Image.asset(
                            'assets/images/notification.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                            color: cubit.currentIndex == 2
                                ? AppColors.primary
                                : null,
                          ),
                        ),
                      )),
                      FloatingNavbarItem(
                          customWidget: CircleAvatar(
                        radius: getSize(context) / 24,
                        backgroundColor: cubit.currentIndex == 3
                            ? AppColors.white
                            : AppColors.secondPrimary,
                        child: Padding(
                          padding:
                              EdgeInsets.all(cubit.currentIndex == 3 ? 6.0 : 3),
                          child: Image.asset(
                            'assets/images/windows.png',
                            width: getSize(context) / 14,
                            height: getSize(context) / 14,
                            color: cubit.currentIndex == 3
                                ? AppColors.primary
                                : null,
                          ),
                        ),
                      )),
                    ],
                    onTap: (index) {
                      setState(() {
                        cubit.currentIndex = index;
                      });
                    },
                    currentIndex: cubit.currentIndex,
                  ),
                )));
      },
    );
  }
}
