import 'package:adpay/core/api/end_points.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';



class advertisements extends StatefulWidget {
  const advertisements({super.key});

  @override
  State<advertisements> createState() => _advertisementsState();
}

class _advertisementsState extends State<advertisements> {
  void initState() {
    super.initState();
    // context.read<HomeCubit>().getHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {
        if (statee is LoadedADS) {
          HomeCubit cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            child: SizedBox(
              // width: 400.w,
              height: 310.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cubit.homeModel?.data?.ads?.length??2,
                  itemBuilder: (index,state){
                return Container(
                  width: 350.w,
                  height: 300.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 400.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                  height: MediaQuery.of(context).size.height * 0.5 / 3,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    // color: Color(0xfff6f6f6),
                                      color:Colors.blue,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  // child: Swiper(
                                  //     autoplay: true,
                                  //     itemCount: cubit.homeModel?.data?.sliders?.length??0,
                                  //     pagination: const SwiperPagination(
                                  //       alignment: Alignment.bottomCenter,
                                  //       builder: DotSwiperPaginationBuilder(
                                  //         color: Colors.grey,
                                  //         activeColor: Colors.green,
                                  //       ),
                                  //     ),
                                  //     duration: 600,
                                  //     itemBuilder: (context, index) {
                                  //  return
                                  child   :   Image.network(
                                    EndPoints.baseUrlImage +
                                        (cubit.homeModel?.data?.ads?[0].image.toString() ??
                                            ''),
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset('assets/images/chair.jpg');
                                    },
                                  )
                                //  }),
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  height: 50.h,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(200),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(.3),
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.network(
                                    EndPoints.baseUrlImage +
                                        (cubit.homeModel?.data?.ads?[0].image
                                            .toString() ??
                                            ''),
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset('assets/images/chair.jpg');
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Align children to the start
                                    children: [
                                      Text("birthday".tr(),
                                          style: Styles.style18.copyWith(
                                              color: AppColors.secondPrimary)),
                                      Text(
                                        (EasyLocalization.of(context)!
                                            .locale
                                            .languageCode ==
                                            'ar')
                                            ? (cubit.homeModel?.data?.ads?[0]
                                            .descriptionAr ??
                                            '')
                                            : (cubit.homeModel?.data?.ads?[0]
                                            .descriptionEn ??
                                            ''),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("advertisement".tr(),
                                          style: Styles.style18.copyWith(
                                              color: AppColors.secondPrimary)),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          );

        } else {
          return const Center(child: Text("no data"));
        }
      },
    );
  }
}
