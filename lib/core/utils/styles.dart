import 'package:adpay/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static TextStyle style48 = TextStyle(
    fontSize: 48.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static TextStyle style30 = TextStyle(
    fontSize: 30.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle style24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle style18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    color:AppColors.primary
  );
  static TextStyle stylebutton = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static TextStyle style14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static TextStyle style16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
      color:AppColors.primary

  );
  
  static TextStyle style12 = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static  TextStyle style25 = TextStyle(
    color: Colors.black,
    fontSize: 25.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );

  // static const TextStyle style18 = TextStyle(
  //   color: Colors.black,
  //   fontSize: 18,
  //   fontFamily: 'Inter',
  //   fontWeight: FontWeight.w400,
  //   height: 0,
  // );

  static  TextStyle styleBold18 = TextStyle(
    color: Colors.black,
    fontSize: 18.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );
  // static const TextStyle style24 = TextStyle(
  //   color: Colors.black,
  //   fontSize: 24,
  //   fontFamily: 'Inter',
  //   fontWeight: FontWeight.w600,
  //   height: 0,
  // );

  static TextStyle style20 = TextStyle(
   // color: Colors.black.withOpacity(0.800000011920929),
    color:AppColors.secondPrimary,
    fontSize: 20.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    height: 0,

  );

  static  TextStyle style22 = TextStyle(
    color: Colors.black,
    fontSize: 22.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 0,
  );
}
