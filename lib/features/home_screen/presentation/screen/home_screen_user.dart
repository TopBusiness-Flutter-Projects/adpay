import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../component/advertisements.dart';
import '../component/bestseller.dart';
import '../component/bestsellerforProducts.dart';
import '../component/catogries.dart';
import '../component/customRow.dart';
import '../component/custom_Appbar.dart';
import '../component/custom_icon_appbar.dart';
import '../component/custom_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../component/grage_widget.dart';
import '../component/store.dart';
import '../component/swiper.dart';
import '../controller/home/home_cubit.dart';
import '../controller/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pagecontroller = PageController();
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHome();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LoadingADS && HomeCubit.get(context).homeModel == null) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return SafeArea(
          bottom: true,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
                child: CustomAppBar()),
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ConditionalBuilder(
                    condition: state is! ShowSliderLoading &&
                        state is! ShowCategoryLoading &&
                        state is! ShowProductLoading,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // image
                            CustomSwiper(),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.CategoriesRoute);
                                },
                                child: CustomRow(
                                  text1: 'Categories'.tr(),
                                  text2: "all".tr(),
                                )),
                            SizedBox(
                              height: 9.h,
                            ),

                            Catogries(),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.advertisement);
                                },
                                child: CustomRow(
                                    text1: 'advertisements'.tr(),
                                    text2: "all".tr())),
                            advertisements(),
                            CustomRow(
                                text1: 'BsetSeller'.tr(), text2: "all".tr()),
                            BestSeller(),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.ShopRoute);
                                },
                                child: CustomRow(
                                  text1: 'theShop'.tr(),
                                  text2: "all".tr(),
                                )),
                            Products(),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.garageRoute);
                                },
                                child: CustomRow(
                                    text1: 'garage'.tr(), text2: "all".tr())),
                            BestSellerforGrage(),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.ProductssRoute,
                                      arguments: '');
                                },
                                child: CustomRow(
                                    text1: 'products'.tr(), text2: "all".tr())),
                            BestSellerforProducts(),
                            SizedBox(
                              height: 100.h,
                            )
                          ],
                        ),
                      );
                    },
                    fallback: (context) =>
                        const Center(child: RefreshProgressIndicator()),
                  ),
          ),
        );

        // else {
        // return const Center(child: Text("no data"));
        // }
      },
    );
  }
}
