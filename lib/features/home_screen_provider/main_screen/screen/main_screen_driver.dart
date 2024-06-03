import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../home_screen/component/custom_Appbar.dart';
import '../../widget/custom_bome_item.dart';
import '../widget/chart.dart';
import '../widget/custom_Appbar_vendor.dart';
import '../cubit/cubit.dart';
import 'swiper_vendor.dart';

class HomeScreenDriver extends StatefulWidget {
  const HomeScreenDriver({super.key});

  @override
  State<HomeScreenDriver> createState() => _HomeScreenDriverState();
}

class _HomeScreenDriverState extends State<HomeScreenDriver> {
  var pagecontroller = PageController();
  @override
  void initState() {
    super.initState();
    context.read<MainVendorCubit>().getVendorHomeData();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainVendorCubit, MainVendorState>(
      listener: (context, state) {
        if (state is LoadingGetHomeVendorState) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();

        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(getSize(context) / 7),
                  child: CustomAppBarVendor()),
              //!
              body: (isLoading || (state is LoadingGetHomeVendorState))
                  ? Center(
                      child: RefreshProgressIndicator(
                          color: AppColors.secondPrimary))
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await cubit.getVendorHomeData();
                        },
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Container(child: CustomSwiperVendor()),
                            SizedBox(height: getSize(context) / 28),
                            Container(
                              // height: getSize(context) / 2,
                              width: getSize(context),
                              child: GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 2,
                                        childAspectRatio: 7 / 5),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  //!
                                  CustomHomeScreenWidget(
                                    imagePath: ImageAssets.walletImage,
                                    title: 'wallet'.tr(),
                                    count:
                                        "${cubit.homeVendorScreenModel?.data?.walletTotal.toString() ?? ''}",
                                  ),
                                  CustomHomeScreenWidget(
                                    imagePath: ImageAssets.totalOrderImage,
                                    title: 'total_count'.tr(),
                                    count:
                                        "${cubit.homeVendorScreenModel?.data?.ordersCount.toString() ?? ''}",
                                  ),
                                  CustomHomeScreenWidget(
                                    imagePath: ImageAssets.totalProductImage,
                                    title: 'total_products'.tr(),
                                    count:
                                        "${cubit.homeVendorScreenModel?.data?.productsCount.toString() ?? ''}",
                                  ),
                                  CustomHomeScreenWidget(
                                    imagePath: ImageAssets.totalAdsImage,
                                    title: 'total_ads'.tr(),
                                    count:
                                        "${cubit.homeVendorScreenModel?.data?.adsCount.toString() ?? ''}",
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: getSize(context) / 22),
                              child: Text(
                                'goal_statistics'.tr(),
                                style: TextStyle(
                                    color: AppColors.secondPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getSize(context) / 16),
                              ),
                            ),
                            CustomFlowChartOfStatisticsGoal()
                          ],
                        ),
                      ),
                    )),
        );
      },
    );
  }
}
