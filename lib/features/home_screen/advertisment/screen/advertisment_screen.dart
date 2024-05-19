import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/adsence_cubit.dart';


class Advertesment_Screen extends StatefulWidget {
  const Advertesment_Screen({super.key});
  @override
  _Advertesment_ScreenState createState() => _Advertesment_ScreenState();
}

class _Advertesment_ScreenState extends State<Advertesment_Screen> {
  // int selectedCategoryIndex = 0;
  void initState() {
    super.initState();
    context.read<AdsenceCubit>().getAdsence();
  }
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<AdsenceCubit, AdsenceState>(
        listener: (context, state) {},
    builder: (context, statee) {
    if (statee is LoadedAdsence) {
    AdsenceCubit cubit = AdsenceCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                              child: Icon(Icons.arrow_back)),
                        ),
                        title: Text("advertisements".tr(),
                            style:
                                Styles.style20.copyWith(color: Colors.black)),
                      ),
                    ),
                    // CategoryCard(
                    //   onCategorySelected: (index) {
                    //     setState(() {
                    //       selectedCategoryIndex = index;
                    //     });
                    //   },
                    // ),
                    // SizedBox(
                    //     // height: MediaQuery.of(context).size.height,
                    //     child:
                    //          ListView.builder(
                    //
                    //             physics: const BouncingScrollPhysics(),
                    //             shrinkWrap: true,
                    //             itemCount: statee.AdsenceModell?.data?.length??1,
                    //             itemBuilder: (BuildContext context, int index) {
                    //               return Container(
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                     CrossAxisAlignment.start, // Align children to the start
                    //                     children: [
                    //                       Align(
                    //                         alignment: Alignment.topRight,
                    //                         child: Container(
                    //                             width: 400.w,
                    //                             height: 150.h,
                    //                             decoration: BoxDecoration(
                    //                               color: Colors.black,
                    //                               borderRadius: BorderRadius.circular(30),
                    //                             ),
                    //                             child: Container(
                    //                               height: MediaQuery.of(context).size.height * 0.5 / 3,
                    //                               width: MediaQuery.of(context).size.width,
                    //                               decoration: BoxDecoration(
                    //                                   color: Color(0xfff6f6f6),
                    //                                   borderRadius: BorderRadius.circular(30)
                    //                               ),
                    //                               // child: Swiper(
                    //                               //     autoplay: true,
                    //                               //     itemCount: 6??0,
                    //                               //     pagination: const SwiperPagination(
                    //                               //       alignment: Alignment.bottomCenter,
                    //                               //       builder: DotSwiperPaginationBuilder(
                    //                               //         color: Colors.grey,
                    //                               //         activeColor: Colors.green,
                    //                               //       ),
                    //                               //     ),
                    //                               //     duration: 600,
                    //                               //     itemBuilder: (context, index) {
                    //                               //       return
                    //                                   child:    Image.network(
                    //                                       EndPoints.baseUrlImage +
                    //                                           (cubit.adesnceModel?.data?[index].image.toString() ??
                    //                                               ''),
                    //                                       errorBuilder: (context, error, stackTrace) {
                    //                                         return Image.asset('assets/images/chair.jpg');
                    //                                       },
                    //                                     )
                    //
                    //                             )
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(8.0),
                    //                         child: Row(
                    //                           children: [
                    //                             Padding(
                    //                               padding: const EdgeInsets.all(3.0),
                    //                               child: Container(
                    //                                 height: 50.h,
                    //                                 padding: const EdgeInsets.all(10),
                    //                                 decoration: BoxDecoration(
                    //                                   color: Colors.white60,
                    //                                   borderRadius: BorderRadius.circular(200),
                    //                                   border: Border.all(
                    //                                     color: Colors.black.withOpacity(.3),
                    //                                     width: 2,
                    //                                   ),
                    //                                 ),
                    //                                 child: Image.network(
                    //                                   EndPoints.baseUrlImage +
                    //                                       (cubit.adesnceModel?.data?[0].image
                    //                                           .toString() ??
                    //                                           ''),
                    //                                   errorBuilder: (context, error, stackTrace) {
                    //                                     return Image.asset('assets/images/chair.jpg');
                    //                                   },
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                             Flexible(
                    //                               child: Padding(
                    //                                 padding: const EdgeInsets.all(8.0),
                    //                                 child: Column(
                    //                                   crossAxisAlignment: CrossAxisAlignment
                    //                                       .start, // Align children to the start
                    //                                   children: [
                    //                                     Text("birthday".tr(),
                    //                                         style: Styles.style18.copyWith(
                    //                                             color: AppColors.secondPrimary)),
                    //                                     Text(
                    //                                       (EasyLocalization.of(context)!
                    //                                           .locale
                    //                                           .languageCode ==
                    //                                           'ar')
                    //                                           ? (cubit.adesnceModel?.data?[0]
                    //                                           .descriptionAr ??
                    //                                           '')
                    //                                           : (cubit.adesnceModel?.data?[0]
                    //                                           .descriptionEn ??
                    //                                           ''),
                    //                                       maxLines: 2,
                    //                                       textAlign: TextAlign.start,
                    //                                       style: TextStyle(
                    //                                         fontSize: 16,
                    //                                         overflow: TextOverflow.ellipsis,
                    //                                         fontWeight: FontWeight.bold,
                    //                                       ),
                    //                                     ),
                    //                                     Text("advertisement".tr(),
                    //                                         style: Styles.style18.copyWith(
                    //                                             color: AppColors.secondPrimary)),
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                             )
                    //                           ],
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //
                    //           )
                    //
                    //          ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                                   shrinkWrap: true,
                      itemCount: cubit.adesnceModel!.data!.length,
                      itemBuilder: (context,  index) {
                        return     SingleChildScrollView(
                          child: SizedBox(
                            // width: 400.w,
                            height: 310.h,
                          child:   Container(
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
                                                  (cubit.adesnceModel?.data?[index].image.toString() ??
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
                                                  (cubit.adesnceModel?.data?[0].image
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
                                                      ? (cubit.adesnceModel?.data?[0]
                                                      .descriptionAr ??
                                                      '')
                                                      : (cubit.adesnceModel?.data?[0]
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
                          ),
                          ),
                        );
                      },

                    ),
                //    SizedBox(height:1000.h)

                  ],
                ),
              ),
            ),
          );
    }
    else {
      return const Center(child: Text("no data"));
    }
    },
    );
  }
}
