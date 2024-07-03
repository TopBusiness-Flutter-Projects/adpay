import 'package:adpay/core/models/Home_models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/get_size.dart';
import '../../../../../core/utils/styles.dart';
import '../../../main_screen/cubit/home_cubit.dart';

class AdvertesmentWidet extends StatelessWidget {
  AdvertesmentWidet({super.key, required this.ads});
  Ads ads;
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.videoPlayer,
            arguments: "https://youtu.be/rcODVrBJdwo?si=no3I8mAq22X2JrWa");
      },
      child: Container(
        width: getSize(context) / 1.08,
        height: 300.h,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(getSize(context) / 32)),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          // color: Color(0xfff6f6f6),
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 32)),
                      child: Image.network(
           (ads.image.toString() ?? ''),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/chair.jpg',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                      //  }),
                      ),
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
          (ads.image.toString() ?? ''),
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
                            Row(
                              children: [
                                Text(
                                    (EasyLocalization.of(context)!
                                                .locale
                                                .languageCode == 'ar')
                                        ? (ads.titleAr ?? '')
                                        : (ads.titleEn ?? ''),
                                    style: Styles.style18
                                        .copyWith(color: AppColors.secondPrimary)),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(ads.countViews.toString()??""),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),
                                    ),

                                  ],
                                )
                              ],
                            ),
                            Text(
                              (EasyLocalization.of(context)!
                                          .locale
                                          .languageCode ==
                                      'ar')
                                  ? (ads.descriptionAr ?? '')
                                  : (ads.descriptionEn ?? ''),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("advertisement".tr()+'.${ads.vendor.toString()??""}',
                                style: Styles.style18.copyWith(color: AppColors.secondPrimary)),
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
    );
  }
}
