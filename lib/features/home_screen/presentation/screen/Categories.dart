import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catogreisss extends StatelessWidget {

  const Catogreisss({Key });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      leading:Padding(
                        padding: const EdgeInsets.all(8.0),
                    child:Image.asset("assets/images/back.png"),
                      ),
                    title: Text("التصنيفات",style: Styles.style20.copyWith(color:Colors.black)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: EdgeInsets.all(16),
                    children: [
                      buildGridItem( 0),
                      buildGridItem( 0),
                      buildGridItem( 1),
                      buildGridItem( 1),
                      buildGridItem( 0),
                      buildGridItem( 0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildGridItem( int index) {
  final imageNames = [
    'chair.jpg',
    'clothes.jpg',
    'chair.jpg',
    'clothes.jpg',
  ];
  final textLabels = [
    'آنث',
    'ساعات',
    'ماركت',
    'ملابس'
  ];
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Container(
      height: 100.h,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 90.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: Expanded(
              child: Image.asset(
                'assets/images/${imageNames[index]}',
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textLabels[index],
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
