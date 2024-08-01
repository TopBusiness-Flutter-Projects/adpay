
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/get_size.dart';
import '../../../../core/utils/hex_color.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/order_details_cubit.dart';
class CustomCartWidgetdetails extends StatefulWidget {
   CustomCartWidgetdetails({super.key, required this.itemCount});
  int itemCount;

  @override
  State<CustomCartWidgetdetails> createState() => _CustomCartWidgetdetailsState();
}

class _CustomCartWidgetdetailsState extends State<CustomCartWidgetdetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            // height: 300.h,
              margin: EdgeInsets.only(top: getSize(context) / 24),
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
                  ]
              ),
              // didnt have scroll
              child: Column(
                children: [
                  SizedBox(
                    // height: 200.h,
                    child: ListView.builder(
                      shrinkWrap: true,

                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: getSize(context) / 8),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:Border.all(

                                    color: Colors.grey.shade300, // Border color
                                    width: 1.0, // Border width

                                  ) ,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.09), // Shadow color
                                      spreadRadius: 1, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: Offset(0, 2), // Shadow position
                                    ),
                                  ]),
                              child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("assets/images/logo.png"),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                    (EasyLocalization.of(context)!
                                        .locale
                                        .languageCode ==
                                        'ar')
                            ? (context.read<OrderDetailsCubit>().getMyOrderModel?.data?.details?[index].product?.titleAr.toString()??"title ar")
                            : (context.read<OrderDetailsCubit>().getMyOrderModel?.data?.details?[index].product?.titleEn.toString()??"title en")

                                            ),
SizedBox(width: 15.w,),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(context.read<OrderDetailsCubit>().getMyOrderModel?.data?.details?[index].product?.price?.toString()??"22",style: Styles.style16,),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(context.read<OrderDetailsCubit>().getMyOrderModel?.data?.details?[index].amount?.toString()??"22"),
                                        ),
                                      ],
                                    ),

                                  ] )
                          ),
                        );
                      },
                      itemCount: widget.itemCount,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("الاجمالي",style: Styles.style16.copyWith(color: Colors.black),),
                        Text(context.read<OrderDetailsCubit>().getMyOrderModel?.data?.total.toString()??"22",style: Styles.style16.copyWith(color: Colors.black),)
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,)
                ],
              )
          ),

        ),

        Positioned(
          top: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Center(
              child: Container(
                alignment: Alignment.topCenter,
                height: getSize(context) / 8,
                padding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color:HexColor('#fdd7cf'),
                  borderRadius: BorderRadius.circular(70.0),
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'محلات كبدز',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    CircleAvatar(
                      child: Image.asset(
                        'assets/images/chair.jpg', // Replace with your image asset path
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );

  }
}

