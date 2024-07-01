import 'dart:io';
import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/features/home_screen/menue/screens/widgets/menue_widget.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/styles.dart';
import '../../../home_screen_provider/main_screen/cubit/cubit.dart';
import '../cubit/logout_cubit.dart';

class MenueScreen extends StatefulWidget {
  const MenueScreen({super.key});

  @override
  State<MenueScreen> createState() => _MenueScreenState();
}

class _MenueScreenState extends State<MenueScreen> {
  @override
  void initState() {
    context.read<MainVendorCubit>().getUserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
      builder: (context, state) {
        var cubit2 = context.read<MainVendorCubit>();
        return BlocBuilder<LogoutCubit, LogoutState>(builder: (context, state) {
          LogoutCubit cubit = LogoutCubit.get(context);
          return SafeArea(
              child: Scaffold(
                  body: (state is LoadingGetUserData || cubit2.userData == null)
                      ? Center(
                          child: RefreshProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text("menue".tr(),
                                  style: Styles.style20
                                      .copyWith(color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              //  width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: AppColors.shadeColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: double.infinity,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  "Mydata".tr(),
                                  style: Styles.style16,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                cubit2.userData!.data!.type == 'vendor'
                                    ? Navigator.pushNamed(
                                        context, Routes.vendorProfile)
                                    : Navigator.pushNamed(
                                        context, Routes.profile);
                              },
                              child: MenueWidget(
                                  text: 'Profilepersonly'.tr(),
                                  path: 'assets/images/profile2.png')),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.messagescreen);
                              },
                              child: MenueWidget(
                                  text: 'Mymessages'.tr(),
                                  path: 'assets/images/message2.png')),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.addharag);
                              },
                              child: MenueWidget(
                                  text: 'AddHaraj'.tr(),
                                  path: 'assets/images/Harag.png')),
                          cubit2.userData!.data!.type == 'user'
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.favouritescreen);
                                  },
                                  child: MenueWidget(
                                      text: 'Favorite'.tr(),
                                      path: 'assets/images/favourite.png'))
                              : Container(),
                          cubit2.userData!.data!.type == 'vendor'
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.addNewProductScreen,
                                        arguments: false);
                                  },
                                  child: MenueWidget(
                                      text: 'add_product'.tr(),
                                      path:
                                          'assets/images/add_new_product.png'))
                              : Container(),
                          cubit2.userData!.data!.type == 'user'
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.addNewAdsScreen);
                                  },
                                  child: MenueWidget(
                                      text: 'add_ads'.tr(),
                                      path: 'assets/images/ads.png')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              //  width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: AppColors.shadeColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: double.infinity,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  "Settings".tr(),
                                  style: Styles.style16,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.contactus);
                              },
                              child: MenueWidget(
                                  text: 'contactus'.tr(),
                                  path: 'assets/images/contactus.png')),
                          // MenueWidget(
                          //     text: 'aboutapp'.tr(),
                          //     path: 'assets/images/i.png'),
                          // MenueWidget(
                          //     text: 'Terms'.tr(),
                          //     path: 'assets/images/verified.png'),
                          InkWell(
                            onTap: () async {
                              PackageInfo packageInfo =
                                  await PackageInfo.fromPlatform();
                              String url = '';
                              String packageName = packageInfo.packageName;

                              if (Platform.isAndroid) {
                                url =
                                    "https://play.google.com/store/apps/details?id=$packageName";
                              } else if (Platform.isIOS) {
                                url =
                                    'https://apps.apple.com/us/app/$packageName';
                              }
                              await Share.share(url);
                            },
                            child: MenueWidget(
                                text: 'Shareapp'.tr(),
                                path: 'assets/images/share.png'),
                          ),
                          InkWell(
                            onTap: () async {
                              PackageInfo packageInfo =
                                  await PackageInfo.fromPlatform();
                              String url = '';
                              String packageName = packageInfo.packageName;

                              if (Platform.isAndroid) {
                                url =
                                    "https://play.google.com/store/apps/details?id=$packageName";
                              } else if (Platform.isIOS) {
                                url =
                                    'https://apps.apple.com/us/app/$packageName';
                              }
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                              //launch url
                            },
                            child: MenueWidget(
                                text: 'evaluation'.tr(),
                                path: 'assets/images/evaluation.png'),
                          ),
                          // BlocProvider(
                          //   create: (context) => LogoutCubit(context.read<ServiceApi>()),
                          //   child: BlocConsumer<LogoutCubit, LogoutState>(
                          //     listener: (context, state) {
                          //       if (state is LoadedLogoutAuth) {
                          //         Preferences.instance.clearAllData().then(
                          //               (value) => Navigator.pushNamedAndRemoveUntil(
                          //             context,
                          //             Routes.initialRoute,
                          //                 (route) => false,
                          //           ),
                          //         );
                          //       } else if (state is ErrorLogoutAuth) {
                          //         errorGetBar('Logout failed');
                          //       }
                          //     },
                          //     builder: (context, state) {
                          //       return InkWell(
                          //         onTap: () {
                          //           if (state is! LoadingLogoutAuth) {
                          //             context.read<LogoutCubit>().loginAuthProvider(context);
                          //           }
                          //         },
                          //         child: MenueWidget(
                          //           text: 'Logout'.tr(),
                          //           path: 'assets/images/logout.png',
                          //           // isLoading: state is LoadingLogoutAuth,
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                          InkWell(
                              onTap: () {
                                cubit.logoutAuthProvider(context);
                              },
                              child: MenueWidget(
                                  text: 'Logout'.tr(),
                                  path: 'assets/images/logout.png')),
                        ]))));
        });
      },
    );
  }
}
