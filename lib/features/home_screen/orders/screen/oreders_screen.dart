import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
          children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        title: Text("orders".tr(),
            style: Styles.style20.copyWith(color: Colors.black)),
      ),
          ),
            Row(
              children: [
                Expanded(
                  child: Container(
                   margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
                    width: getSize(context) / 3,
                    decoration: BoxDecoration(
                      color:
                       AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('الطلبات المكتمله',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
                    width: getSize(context) / 3,
                    decoration: BoxDecoration(
                      color:
                      AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('الطلبات المكتمله',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                          AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 900.h,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      // height: 300.h,
                      margin: EdgeInsets.only(top: getSize(context) / 40),
                      width: getSize(context),
                      decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          border: Border.all(
                            color: Colors.red, // Border color
                            width: 2.0, // Border width
                          ),
                          borderRadius:
                          BorderRadius.circular(20.0), // Border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.01), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 2), // Shadow position
                            ),
                          ]),
                      // didnt have scroll
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.account_circle),
                              Text("رقم الطلب"),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#235345435"),
                              )
                            ],),
                          Row(
                            children: [
                              Icon(Icons.account_circle),
                              Text("رقم الطلب"),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#235345435"),
                              )
                            ],),
                          Row(
                            children: [
                              Icon(Icons.account_circle),
                              Text("رقم الطلب"),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#235345435"),
                              )
                            ],),
                        ],
                      ),
                    ),

                  );
                },
                         itemCount: 3,
              ),
            ),
            Container(height:1300.h,color:Colors.white),
         ]
      )

    );

  }
}
