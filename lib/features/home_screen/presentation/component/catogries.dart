import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catogries extends StatelessWidget {
   Catogries({Key? key});
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
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: 120.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {

          return Container(
            // height: 100.h,
            width: MediaQuery.of(context).size.width/4.2,
            // padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                   height: 85.h,
                //  margin: EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),

                    child: Image.asset(
                      'assets/images/${imageNames[index]}',
                    ),
                  ),
                ),
                // SizedBox(height: 8.h),
                Flexible(
                  child: Text(
                    textLabels[index],
                    style: TextStyle(
                     // fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}