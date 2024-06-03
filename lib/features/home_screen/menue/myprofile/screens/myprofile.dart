import 'package:adpay/core/utils/hex_color.dart';
import 'package:adpay/features/home_screen/menue/myprofile/cubit/get_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/styles.dart';
import '../../screens/widgets/menue_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  void initState() {
    super.initState();
    context.read<GetProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
      GetProfileCubit cubit = GetProfileCubit.get(context);
      return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
              ),
              title: Text("profile".tr(),
                  style: Styles.style20.copyWith(color: Colors.black)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo2.png",
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.profileModel?.data.name ?? "adPay",
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(cubit.profileModel?.data.phone.toString() ??
                          "0128686868"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: HexColor('#fbdede'),
              width: MediaQuery.sizeOf(context).width,
              height: 100.h,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("orders".tr()),
                        Text(
                          cubit.profileModel?.data.ordersCount.toString() ??
                              '0',
                          style: Styles.style16.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Container(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forester".tr()),
                        Text(
                          cubit.profileModel?.data.auctionsCount.toString() ??
                              "0",
                          style: Styles.style16.copyWith(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Container(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("advertisements".tr()),
                        Text(
                          cubit.profileModel?.data.viewAdsCount.toString() ??
                              "0",
                          style: Styles.style16.copyWith(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.points);
                  },
                  child: Hero(
                    tag: 'nono',
                    child: Container(
                      width: 160.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, // Lighter shadow color
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, top: 5.0),
                            child: Text(
                              "points".tr(),
                              style:
                                  Styles.style16.copyWith(color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/coins.png"),
                              ),
                              Text(
                                cubit.profileModel?.data.points.toString() ??
                                    "0",
                                style: Styles.style16
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.pocket);
                  },
                  child: Hero(
                    tag: 'pocket',
                    child: Container(
                      width: 160.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, // Lighter shadow color
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, top: 5.0),
                            child: Text(
                              "pocket".tr(),
                              style:
                                  Styles.style16.copyWith(color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/pocket.png"),
                              ),
                              Text(
                                cubit.profileModel?.data.auctionsCount.toString() ??
                                    "0",
                                style: Styles.style16
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.myharag);
              },
              child: MenueWidget(
                text: 'Forester'.tr(),
                path: 'assets/images/boxes.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.places);
              },
              child: MenueWidget(
                text: 'places'.tr(),
                path: 'assets/images/places.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.editprofile);
              },
              child: MenueWidget(
                text: 'edit'.tr(),
                path: 'assets/images/edit.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenueWidget(
              text: 'delete'.tr(),
              path: 'assets/images/delete.png',
            ),
          ),
        ]))),
      );
    });
  }
}
