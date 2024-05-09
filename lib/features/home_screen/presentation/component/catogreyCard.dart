//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart%20';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var widthh=MediaQuery.of(context).size.width;
//
//     return SizedBox(
//       height: 42.h,
//       child: ListView.builder(
//           itemCount:4,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: GestureDetector(
//               onTap: () {
//                 switch (index) {
//                   case 0:
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => Container(child:Text("nehal")), // Replace NextPage with your page
//                       ),
//                     );
//                     break;
//                   case 1:
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => Container(child:Text("nehal"), // Replace NextPage with your page
//                       ),
//                     );
//                     break;
//                 // Add more cases for other pages
//                 }
//               },
//               child: Container(
//                 width: widthh/3,
//                 decoration: BoxDecoration(
//                   // color: categoryData[index].active
//                   //     ? kprimaryClr
//                   //     : klightGrayClr,
//                   color:klightGrayClr,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                         categoryData[index].icon,
//                         color:
//                         // categoryData[index].active ? kwhiteClr : kblackClr,
//                         kblackClr
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     Text(
//                       categoryData[index].title,
//                       style: TextStyle(
//                         // color: categoryData[index].active
//                         //     ? kwhiteClr
//                         //     : kblackClr,
//                           color:   kblackClr,
//                           fontSize: 20,fontWeight: FontWeight.w600),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }