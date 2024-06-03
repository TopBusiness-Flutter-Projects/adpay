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
    context.read<MainVendorCubit>().getUserModel();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainVendorCubit, MainVendorState>(
      listener: (context, state) {
        // if (state is LoadingADS) {
        //   isLoading = true;
        // } else {
        //   isLoading = false;
        // }
      },
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();

        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(getSize(context) / 7),
                child: CustomAppBarVendor()),
            //!
            body: ConditionalBuilder(
              condition: true, // (state is LoadedGetHomeVendorState),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // await cubit.getHome();
                    },
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(child: CustomSwiperVendor()),
                        SizedBox(height: 5.h),
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
                                title: 'المحفظة',
                                count: "1000",
                              ),
                              CustomHomeScreenWidget(
                                imagePath: ImageAssets.totalOrderImage,
                                title: 'اجمالى الطلبات',
                                count: "2",
                              ),
                              CustomHomeScreenWidget(
                                imagePath: ImageAssets.totalProductImage,
                                title: 'اجمالى المنتجات',
                                count: "2",
                              ),
                              CustomHomeScreenWidget(
                                imagePath: ImageAssets.totalAdsImage,
                                title: 'اجمالى الاعلانات',
                                count: "2",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              fallback: (context) =>
                  const Center(child: RefreshProgressIndicator()),
            ),
          ),
        );
      },
    );
  }
}
