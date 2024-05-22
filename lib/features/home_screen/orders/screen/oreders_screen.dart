import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool ?colors=true;
  bool colors2=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
          children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
       
        title: Text("orders".tr(),
            style: Styles.style20.copyWith(color: Colors.black)),
      ),
          ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                       colors==true? colors=false:colors=true;
                      });
                    },
                    child: Container(
                     margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
                      width: getSize(context) / 3,
                      decoration: BoxDecoration(
                        color: colors == true ? AppColors.primary : AppColors.secondPrimary,
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
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        colors2==true? colors2=false:colors2=true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 6),
                      width: getSize(context) / 3,
                      decoration: BoxDecoration(

                        color: colors2 == true ? AppColors.primary : AppColors.secondPrimary,
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
                ),
              ],
            ),
            Container(
              height: 3000.h,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/ordernumber.png"),
                              ),
                              Text("ordernum".tr()),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("#235345435"),
                              )
                            ],),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/calender.png"),
                              ),
                              Text("ordernum".tr()),
                              SizedBox(width: 30.w,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/watch.png"),
                              ),
                              Text("pm 3:23"),
                            ],),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/grage.png"),
                              ),
                              Text("ordernum".tr()),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.orderDetails);

                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("details".tr(),style: TextStyle(color: AppColors.primary),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0),
                                child: Image.asset("assets/images/forwarddetails.png"),
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

SizedBox(height: 200.h,)
         ]
      )

    );

  }
}
