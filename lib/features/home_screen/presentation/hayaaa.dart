import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/get_size.dart';
import '../../../core/utils/styles.dart';

import 'package:flutter/material.dart';

// class Hayaa extends StatelessWidget {
//   const Hayaa({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//       appBar: AppBar(
//         title: Text('السلة'),
//       ),
//       body: Column(
//         children: [
//           ProductCard(
//             title: 'صندوق كبير',
//             price: 200,
//             quantities: [2, 1],
//           ),
//           ProductCard(
//             title: 'صندوق كبير',
//             price: 300,
//             quantities: [2, 1],
//           ),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('إكمال الطلب'),
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: Text('الغاء'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//     //   Scaffold(
//     //     body: Center(
//     //       child: Container(
//     //         padding: EdgeInsets.all(16.0),
//     //         decoration: BoxDecoration(
//     //           color: Colors.white,
//     //           borderRadius: BorderRadius.circular(8.0),
//     //           border: Border.all(
//     //             color: Colors.pink,
//     //             width: 2.0,
//     //           ),
//     //         ),
//     //         child: Column(
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: [
//     //             Row(
//     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //               children: [
//     //                 Text(
//     //                   'صندوق كبير',
//     //                   style: TextStyle(
//     //                     fontSize: 18.0,
//     //                     fontWeight: FontWeight.bold,
//     //                   ),
//     //                 ),
//     //                 Row(
//     //                   children: [
//     //                     Icon(
//     //                       Icons.shopping_cart,
//     //                       color: Colors.red,
//     //                     ),
//     //                     Text(
//     //                       '300',
//     //                       style: TextStyle(
//     //                         fontSize: 16.0,
//     //                         fontWeight: FontWeight.bold,
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ],
//     //             ),
//     //             SizedBox(height: 8.0),
//     //             Row(
//     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //               children: [
//     //                 Row(
//     //                   children: [
//     //                     Icon(
//     //                       Icons.shopping_cart,
//     //                       color: Colors.red,
//     //                     ),
//     //                     SizedBox(width: 8.0),
//     //                     Text(
//     //                       '200',
//     //                       style: TextStyle(
//     //                         fontSize: 16.0,
//     //                         fontWeight: FontWeight.bold,
//     //                       ),
//     //                     ),
//     //                     SizedBox(width: 16.0),
//     //                     Container(
//     //                       width: 50.0,
//     //                       height: 30.0,
//     //                       decoration: BoxDecoration(
//     //                         borderRadius: BorderRadius.circular(4.0),
//     //                         border: Border.all(
//     //                           color: Colors.grey,
//     //                           width: 1.0,
//     //                         ),
//     //                       ),
//     //                       child: Center(
//     //                         child: Text(
//     //                           '2',
//     //                           style: TextStyle(
//     //                             fontSize: 16.0,
//     //                             fontWeight: FontWeight.bold,
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //                 Row(
//     //                   children: [
//     //                     Icon(
//     //                       Icons.shopping_cart,
//     //                       color: Colors.red,
//     //                     ),
//     //                     SizedBox(width: 8.0),
//     //                     Text(
//     //                       '100',
//     //                       style: TextStyle(
//     //                         fontSize: 16.0,
//     //                         fontWeight: FontWeight.bold,
//     //                       ),
//     //                     ),
//     //                     SizedBox(width: 16.0),
//     //                     Container(
//     //                       width: 50.0,
//     //                       height: 30.0,
//     //                       decoration: BoxDecoration(
//     //                         borderRadius: BorderRadius.circular(4.0),
//     //                         border: Border.all(
//     //                           color: Colors.grey,
//     //                           width: 1.0,
//     //                         ),
//     //                       ),
//     //                       child: Center(
//     //                         child: Text(
//     //                           '1',
//     //                           style: TextStyle(
//     //                             fontSize: 16.0,
//     //                             fontWeight: FontWeight.bold,
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ],
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //     ),
//     //   );
//
//   }
// }
class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final List<int> quantities;

  ProductCard({
    required this.title,
    required this.price,
    required this.quantities,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'د.ب ${price.toString()}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityInput(quantity: quantities[0]),
                QuantityInput(quantity: quantities[1]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityInput extends StatelessWidget {
  final int quantity;

  QuantityInput({required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.shopping_cart),
        SizedBox(width: 8.0),
        Text(quantity.toString()),
      ],
    );
  }
}

class Hayaa extends StatelessWidget {
  const Hayaa({super.key});

  @override
  Widget build(BuildContext context) {
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
                  itemCount:10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomCartWidget(itemCount: index+1,),

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
                        Text("الاجمالي",style: Styles.style16.copyWith(color: Colors.black),),
                        Text("900 ريال",style: Styles.style16.copyWith(color: Colors.black),)
                      ],),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // لون الزر
                          ), child: Text("الغاء",style: TextStyle(
                            color:Colors.white,fontSize: 15.sp
                          ),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, Routes.completeorder,);
                          },style: ElevatedButton.styleFrom(
                            backgroundColor:AppColors.secondPrimary, // لون الزر
                          ), child: Text("اكمال الطلب",style: TextStyle(
    color:Colors.white,fontSize: 15.sp
    ))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
SizedBox(height: 90.h,)

            ])));
  }
}


class CustomCartWidget extends StatefulWidget {
   CustomCartWidget({super.key,
  required this.itemCount
  });
int itemCount;
  @override
  State<CustomCartWidget> createState() => _CustomCartWidgetState();
}

class _CustomCartWidgetState extends State<CustomCartWidget> {
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
                      color: Colors.grey.withOpacity(0.3), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 2), // Shadow position
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
                      padding: EdgeInsets.only(top: getSize(context) / 8),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3), // Shadow color
                                      spreadRadius: 5, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: Offset(0, 2), // Shadow position
                                    ),
                                  ])),
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
                      Text("900 ريال",style: Styles.style16.copyWith(color: Colors.black),)
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
              child: Container(alignment: Alignment.topCenter,
                height: getSize(context) / 8,
                padding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
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
