import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({super.key,required this.text});
String ?text;
  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Center(
        child: SizedBox(
          width: 250.w,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.completeorder);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // لون الزر
              // minimumSize: Size(50.w, 50), // تحديد الحد الأدنى للعرض والارتفاع
            ),
            child: Center(
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
