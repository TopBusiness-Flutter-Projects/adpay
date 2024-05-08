import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class advertisements extends StatelessWidget {
  const advertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return                         Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start

        children: [
          Align(
            alignment:  Alignment.topRight,
            child: Container(
              width: 400.w,
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(
                //   color: Colors.red,
                //   width: 2,
                // ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/Rectangle.png",
                  fit: BoxFit.cover,
                ),
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
                    child: Expanded(
                      child: Image.asset(
                        'assets/images/chair.jpg',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start

                    children: [
                      Text("birthday".tr(),style: Styles.style18.copyWith(color:AppColors.secondPrimary)),
                      Text("Discounts".tr()),
                      Text("advertisement".tr(),style: Styles.style18.copyWith(color:AppColors.secondPrimary)),

                    ],),
                )
              ],
            ),
          )

        ],
      ),
    )
    ;
  }
}
