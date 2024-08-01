import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

createProgressDialog(BuildContext context, String msg) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        content: Row(
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              msg,
              style: TextStyle(color: AppColors.black, fontSize: 15.0),
            )
          ],
        ),
      );
    },
  );
}

// createProgressDialog2(BuildContext context, String msg) {
//   showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: AppColors.white,
//         content: Row(
//           children: [
//
//             SizedBox(
//               height: 200.h,
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Positioned(
//                     top:0.0,
//                       left:0,
//                       right: 100,
//                       bottom: 200,
//                       child: Image.asset("assets/images/close.png")),
//
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: RatingBar.builder(
//                         initialRating: double.parse(
//
//                             "0"),
//                         minRating: 1,
//                         direction: Axis.horizontal,
//                         allowHalfRating: true,
//                         itemCount: 5,
//                         itemPadding: EdgeInsets.symmetric(
//                             horizontal: 4.0),
//                         itemBuilder: (context, _) => Icon(
//                           Icons.star_border_outlined,
//                           color: Colors.amber,
//                         ),
//                         onRatingUpdate: (rating) {
//                           print(rating);
//                         },
//                         itemSize: 20.0,
//                         tapOnlyMode:
//                         true, // Disable tapping to change the rating
//                         updateOnDrag: false,
//                         ignoreGestures: true,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Container(
//                         width: 200.w,
//                         height: 100.h,
//                         decoration: BoxDecoration(
//                           color:Colors.white,
//                          border: Border.all(
//                             color: Colors.grey, // Change this to your desired border color
//                             width: 1.0, // Adjust the width of the border as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("اكتب تعليقك",style: TextStyle(color:Colors.black,),),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                     width: 100.w,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color:Colors.red,
//                         ),
//                           borderRadius: BorderRadius.circular(10.0),
//                           color:AppColors.shadeColor
//                       ),
//                       child: Center(child: Text("تاكيد")),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//
//           ],
//         ),
//       );
//     },
//   );
// }
createProgressDialog2(BuildContext context, String msg) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: AppColors.transparent,
        content: Container(
          height: 250.h,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/close.png",
                    // width: 30.0, // Adjust size as needed
                    // height: 30.0, // Adjust size as needed
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: RatingBar.builder(
                  initialRating: 0.0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_border_outlined,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                  itemSize: 20.0,
                  tapOnlyMode: true, // Disable tapping to change the rating
                  updateOnDrag: false,
                  ignoreGestures: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors
                          .grey, // Change this to your desired border color
                      width: 1.0, // Adjust the width of the border as needed
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "writecomment".tr(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getSize(context) / 4),
                // width: 100.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.shadeColor,
                ),
                child: Container(
                    child: Text(
                  "confirm".tr(),
                  style: Styles.style16,
                )),
              ),
            ],
          ),
        ),
      );
    },
  );
}
