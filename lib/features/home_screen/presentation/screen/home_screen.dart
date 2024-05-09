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
import '../component/catogries.dart';
import '../component/customRow.dart';
import '../component/custom_Appbar.dart';
import '../component/custom_icon_appbar.dart';
import '../component/custom_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../component/store.dart';
import '../component/swiper.dart';
import '../controller/home_cubit.dart';
import '../controller/home_state.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
            child:CustomAppBar()
          ),
          body:
          SingleChildScrollView(
            child: ConditionalBuilder(
              condition:state is! ShowSliderLoading && state is! ShowCategoryLoading && state is! ShowProductLoading,
              builder: (context){
                return   SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // image
                        CustomSwiper(),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomRow(text1: 'Categories'.tr(),text2:"all".tr() ,),
                        SizedBox(
                          height: 9.h,
                        ),

                        Catogries()    ,
                        SizedBox(
                          height: 50.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomRow(text1: 'advertisements'.tr(),text2:"all".tr() ),
                        ),
                        advertisements(),
                        CustomRow(text1: 'BsetSeller'.tr(),text2:"all".tr() ),
                        BestSeller(),
                        CustomRow(text1: 'theShop'.tr(),text2:"all".tr(),),
                        Products(),
                        CustomRow(text1: 'garage'.tr(),text2:"all".tr() ),
                        BestSeller(),
                        InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.CategoriesRoute);
                            },
                            child: CustomRow(text1: 'products'.tr(),text2:"all".tr())),
                        BestSeller(),
                        // SizedBox(
                        //   height: 200,
                        //   child: Directionality(
                        //     textDirection: TextDirection.rtl,
                        //     child: GridView.count(
                        //       crossAxisCount: 3, // Number of columns
                        //       crossAxisSpacing: 8.0, // Horizontal spacing
                        //       mainAxisSpacing: 8.0, // Vertical spacing
                        //       padding: EdgeInsets.all(16.0),
                        //       children: [
                        //         buildGridItem('assets/images/car1.jpg', 'صالح للسيارات'),
                        //         buildGridItem('assets/images/store.jpg', 'محلات حجاب'),
                        //         buildGridItem('assets/images/car2.jpg', 'صالح للسيارات'),
                        //         buildGridItem('assets/images/jewelry.jpg', 'محلات كندر'),
                        //         buildGridItem('assets/images/shoes.jpg', 'أحذية البراق'),
                        //         buildGridItem('assets/images/watch.jpg', 'ساعات محمود'),
                        //       ],
                        //     ),
                        //   ),
                        // ),



                      ],
                    ),
                  ),
                );
              },
              fallback:(context)=>const Center(child: RefreshProgressIndicator()) ,
                ),
          ),


        );
      },
    );
  }
}
