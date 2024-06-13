import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/get_size.dart';
import '../../../../../core/utils/hex_color.dart';
import '../../../../../core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../cubit/salla_cubit.dart';
class SallaScreen extends StatefulWidget {
  const SallaScreen({super.key});

  @override
  State<SallaScreen> createState() => _SallaScreenState();
}

class _SallaScreenState extends State<SallaScreen> {
  int _counter = 0;
  int ?itemCount;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaCubit, SallaState>(
        listener: (context, state) {},
    builder: (context, statee) {
      if (statee is SallaLoading) {
        return CircularProgressIndicator();
    }
      else{
        SallaCubit cubit = SallaCubit.get(context);
        return SafeArea(
            child: Scaffold(
                body: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("basket".tr(),
                          style: Styles.style20.copyWith(color: Colors.black)),
                    ),
                  ),
                  Flexible(
                    //main scrooll >>have
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 300.h,
                                      margin: EdgeInsets.only(
                                          top: getSize(context) / 24),
                                      width: getSize(context),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          // Background color
                                          border: Border.all(
                                            color: Colors.red, // Border color
                                            width: 2.0, // Border width
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(20.0),
                                          // Border radius
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.01), // Shadow color
                                              spreadRadius: 5, // Spread radius
                                              blurRadius: 7, // Blur radius
                                              offset: Offset(
                                                  0, 2), // Shadow position
                                            ),
                                          ]),
                                      // didnt have scroll
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            // height: 200.h,
                                            child: ListView.builder(
                                              shrinkWrap: true,

                                              physics: const BouncingScrollPhysics(),
                                              padding: EdgeInsets.only(
                                                  top: getSize(context) / 8),
                                              itemBuilder: (
                                                  BuildContext context,
                                                  int index) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      8.0),
                                                  child: Container(
                                                      width: 100.w,
                                                      height: 100.h,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(

                                                            color: Colors.grey
                                                                .shade300,
                                                            // Border color
                                                            width: 1.0, // Border width

                                                          ),
                                                          borderRadius: BorderRadius
                                                              .circular(15.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                  0.09),
                                                              // Shadow color
                                                              spreadRadius: 1,
                                                              // Spread radius
                                                              blurRadius: 7,
                                                              // Blur radius
                                                              offset: Offset(0,
                                                                  2), // Shadow position
                                                            ),
                                                          ]),
                                                      child: Row(
                                                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .all(8.0),
                                                              child: Image
                                                                  .asset(
                                                                  "assets/images/logo.png"),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(
                                                                    "تيشيرت رصاصي"),
                                                                // ElevatedButton(onPressed: (){}, child: Text("hi"))
                                                                Container(
                                                                  height: 30.h,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                      top: getSize(
                                                                          context) /
                                                                          24),
                                                                  width: getSize(
                                                                      context) /
                                                                      2.7,
                                                                  decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    // Background color
                                                                    border: Border
                                                                        .all(
                                                                      color: Colors
                                                                          .red,
                                                                      // Border color
                                                                      width: 2.0, // Border width
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        20.0), // Border radius
                                                                    // boxShadow: [
                                                                    //   BoxShadow(
                                                                    //     color: Colors.grey.withOpacity(0.3), // Shadow color
                                                                    //     spreadRadius: 5, // Spread radius
                                                                    //     blurRadius: 7, // Blur radius
                                                                    //     offset: Offset(0, 2), // Shadow position
                                                                    //   ),
                                                                    // ]),
                                                                  ),
                                                                  child:
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      // IconButton(
                                                                      //   icon: Icon(Icons.add),
                                                                      //   onPressed: _incrementCounter,
                                                                      // ),
                                                                      InkWell(
                                                                          onTap: () {
                                                                            setState(() {
                                                                              _counter++;
                                                                            });
                                                                          }
                                                                          ,
                                                                          child: Image
                                                                              .asset(
                                                                              "assets/images/add.png")),
                                                                      Text(
                                                                        '$_counter',
                                                                        style: TextStyle(
                                                                            fontSize: 24.0),
                                                                      ),
                                                                      InkWell(
                                                                          onTap: () {
                                                                            setState(() {
                                                                              _counter--;
                                                                            });
                                                                          },
                                                                          child: Image
                                                                              .asset(
                                                                              "assets/images/minus.png")),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .all(8.0),
                                                                  child: Text(
                                                                    "200 ريال",
                                                                    style: Styles
                                                                        .style16,),
                                                                ),
                                                                Icon(Icons
                                                                    .delete_outline,
                                                                    color: AppColors
                                                                        .primary)
                                                              ],
                                                            )
                                                          ])
                                                  ),
                                                );
                                              },
                                              itemCount:itemCount,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("الاجمالي",
                                                  style: Styles.style16
                                                      .copyWith(
                                                      color: Colors.black),),
                                                Text("900 ريال",
                                                  style: Styles.style16
                                                      .copyWith(
                                                      color: Colors.black),)
                                              ],),
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
                                        EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        decoration: BoxDecoration(
                                          color: HexColor('#fdd7cf'),
                                          borderRadius: BorderRadius.circular(
                                              70.0),
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
                                                'assets/images/chair.jpg',
                                                // Replace with your image asset path
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
                            )
                          ],
                        );
                      },),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("total".tr(), style: Styles.style16.copyWith(
                                color: Colors.black),),
                            Text("nehal", style: Styles.style16.copyWith(
                                color: Colors.black),)
                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red, // لون الزر
                                    ),
                                    child: Text("cancel".tr(), style: TextStyle(
                                        color: Colors.white, fontSize: 15.sp
                                    ),)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pushNamed(
                                    context, Routes.completeorder,);
                                },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors
                                          .secondPrimary, // لون الزر
                                    ),
                                    child: Text(
                                        "ordercomplete".tr(), style: TextStyle(
                                        color: Colors.white, fontSize: 15.sp
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,)

                ])));
      }
    }

    );}
  }



// class CustomCartWidget extends StatefulWidget {
//    CustomCartWidget({super.key,
//   required this.itemCount});
// int itemCount;
//   @override
//   State<CustomCartWidget> createState() => _CustomCartWidgetState();
// }
//
// class _CustomCartWidgetState extends State<CustomCartWidget> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _decrementCounter() {
//     setState(() {
//       print("nono");
//       _counter--;
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     context.read<SallaCubit>().getCart();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SallaCubit, SallaState>(
//         listener: (context, state) {},
//     builder: (context, statee) {
//     if (statee is SallaLoaded) {
//     SallaCubit cubit = SallaCubit.get(context);
//     return Stack(alignment: Alignment.topCenter,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             // height: 300.h,
//               margin: EdgeInsets.only(top: getSize(context) / 24),
//               width: getSize(context),
//               decoration: BoxDecoration(
//                   color: Colors.white, // Background color
//                   border: Border.all(
//                     color: Colors.red, // Border color
//                     width: 2.0, // Border width
//                   ),
//                   borderRadius:
//                   BorderRadius.circular(20.0), // Border radius
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.01), // Shadow color
//                       spreadRadius: 5, // Spread radius
//                       blurRadius: 7, // Blur radius
//                       offset: Offset(0, 2), // Shadow position
//                     ),
//                   ]),
//               // didnt have scroll
//               child: Column(
//                 children: [
//                   SizedBox(
//                     // height: 200.h,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//
//                       physics: const BouncingScrollPhysics(),
//                       padding: EdgeInsets.only(top: getSize(context) / 8),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                               width: 100.w,
//                               height: 100.h,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border:Border.all(
//
//                                       color: Colors.grey.shade300, // Border color
//                                       width: 1.0, // Border width
//
//                                   ) ,
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.grey
//                                           .withOpacity(0.09), // Shadow color
//                                       spreadRadius: 1, // Spread radius
//                                       blurRadius: 7, // Blur radius
//                                       offset: Offset(0, 2), // Shadow position
//                                     ),
//                                   ]),
//                            child:Row(
//                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                children:[
//
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Image.asset("assets/images/logo.png"),
//                              ),
//                              Column(
//                                children: [
//                                  Text("تيشيرت رصاصي"),
//                                  // ElevatedButton(onPressed: (){}, child: Text("hi"))
//                                  Container(
//                                    height:30.h,
//                                    margin: EdgeInsets.only(top: getSize(context) / 24),
//                                    width: getSize(context)/2.7,
//                                    decoration: BoxDecoration(
//                                        color: Colors.white, // Background color
//                                        border: Border.all(
//                                          color: Colors.red, // Border color
//                                          width: 2.0, // Border width
//                                        ),
//                                        borderRadius:
//                                        BorderRadius.circular(20.0), // Border radius
//                                        // boxShadow: [
//                                        //   BoxShadow(
//                                        //     color: Colors.grey.withOpacity(0.3), // Shadow color
//                                        //     spreadRadius: 5, // Spread radius
//                                        //     blurRadius: 7, // Blur radius
//                                        //     offset: Offset(0, 2), // Shadow position
//                                        //   ),
//                                        // ]),
//                                    ),
//                                    child:
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.center,
//                                      children: [
//                                        // IconButton(
//                                        //   icon: Icon(Icons.add),
//                                        //   onPressed: _incrementCounter,
//                                        // ),
//                                        InkWell(
//                                        onTap: (){
//                                          setState(() {
//                                            _counter++;
//                                          });
//                                        }
//                                          ,
//                                            child: Image.asset("assets/images/add.png")),
//                                        Text(
//                                          '$_counter',
//                                          style: TextStyle(fontSize: 24.0),
//                                        ),
//                                        InkWell(
//                                            onTap: (){
//                                              setState(() {
//                                                _counter--;
//                                              });
//                                            },
//                                            child: Image.asset("assets/images/minus.png")),
//                                      ],
//                                    ),
//                                  )
//                                ],
//                              ),
//                                  Spacer(),
//                              Column(
//                                children: [
//                                  Padding(
//                                    padding: const EdgeInsets.all(8.0),
//                                    child: Text("200 ريال",style: Styles.style16,),
//                                  ),
//                                  Icon(Icons.delete_outline,color:AppColors.primary)
//                                ],
//                              )
//                            ] )
//                           ),
//                         );
//                       },
//                       itemCount: widget.itemCount,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                     Text("الاجمالي",style: Styles.style16.copyWith(color: Colors.black),),
//                       Text("900 ريال",style: Styles.style16.copyWith(color: Colors.black),)
//                     ],),
//                   ),
//                   SizedBox(height: 10.h,)
//                 ],
//               )
//           ),
//
//         ),
//
//         Positioned(
//           top: 0,
//           child: Align(
//             alignment: Alignment.topCenter,
//             child: Center(
//               child: Container(
//                 alignment: Alignment.topCenter,
//                 height: getSize(context) / 8,
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 decoration: BoxDecoration(
//                   color:HexColor('#fdd7cf'),
//                   borderRadius: BorderRadius.circular(70.0),
//                   border: Border.all(
//                     color: Colors.red,
//                     width: 2.0,
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'محلات كبدز',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 8.0),
//                     CircleAvatar(
//                       child: Image.asset(
//                         'assets/images/chair.jpg', // Replace with your image asset path
//                         width: 50.0,
//                         height: 50.0,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//     else {
//       return  Container();
//     }
// });}}
