import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/styles.dart';
class MyHarag extends StatelessWidget {
  const MyHarag({super.key});
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.arrow_back)),
                            ),
                            title: Text("Forester".tr(), style: Styles.style20.copyWith(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child:GridView.builder(
                              padding: EdgeInsets.all(16),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(   crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) { return SizedBox(
                                height: 200.h,
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(
                                          context, Routes.myharagdetails
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 150.w,
                                          height: 300.h,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.005), // Lighter shadow color
                                                blurRadius: 2,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.black.withOpacity(0.05), // Lighter shadow color
                                              width: 2,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              // Flexible(
                                              //   fit: FlexFit.tight,
                                              //   child: ManageNetworkImage(imageUrl: product?.images?.first??"",),
                                              // ),
                                              Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Image.asset("assets/images/chair.jpg")),
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.only(top: 2.0,right:7),
                                                child: Text(
                                                  "nono", maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.bold,
                                                  ),),


                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        "text",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          overflow: TextOverflow.ellipsis,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    // Row(
                                                    //   children: [
                                                    //     Icon(
                                                    //       Icons.star,
                                                    //       color: Colors.amber,
                                                    //       size: 18,
                                                    //     ),
                                                    //     SizedBox(width: 4),
                                                    //     Text(
                                                    //       product?.rate?.toString()??'',
                                                    //       style: TextStyle(
                                                    //         fontSize: 16,
                                                    //         fontWeight: FontWeight.bold,
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: Icon(Icons.favorite,color: AppColors.primary,),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ); },

                            )
                        ),
                      ] )
              )
          )
      );
  }
}
