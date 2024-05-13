// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart%20';
//
// import '../../../../core/utils/styles.dart';
//
// class Product_details extends StatelessWidget {
//   const Product_details({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                   leading: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                         onTap: (){
//                           Navigator.pop(context);
//                         },
//                         child: Icon(Icons.arrow_back)),
//                   ),
//                   title: Text("advertisements".tr(),
//                       style:
//                       Styles.style20.copyWith(color: Colors.black)),
//                 ),
//               ),
//               // CategoryCard(
//               //   onCategorySelected: (index) {
//               //     setState(() {
//               //       selectedCategoryIndex = index;
//               //     });
//               //   },
//               // ),
//               SizedBox(
//                 // height: MediaQuery.of(context).size.height,
//                   child: selectedCategoryIndex == 0
//                       ? ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: statee.AdsenceModell?.data?.length??1,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment:
//                             CrossAxisAlignment.start, // Align children to the start
//                             children: [
//                               Align(
//                                 alignment: Alignment.topRight,
//                                 child: Container(
//                                     width: 400.w,
//                                     height: 150.h,
//                                     decoration: BoxDecoration(
//                                       color: Colors.black,
//                                       borderRadius: BorderRadius.circular(30),
//                                     ),
//                                     child: Container(
//                                       height: MediaQuery.of(context).size.height * 0.5 / 3,
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                           color: Color(0xfff6f6f6),
//                                           borderRadius: BorderRadius.circular(30)
//                                       ),
//                                       child: Swiper(
//                                           autoplay: true,
//                                           itemCount: 6??0,
//                                           pagination: const SwiperPagination(
//                                             alignment: Alignment.bottomCenter,
//                                             builder: DotSwiperPaginationBuilder(
//                                               color: Colors.grey,
//                                               activeColor: Colors.green,
//                                             ),
//                                           ),
//                                           duration: 600,
//                                           itemBuilder: (context, index) {
//                                             return    Image.network(
//                                               EndPoints.baseUrlImage +
//                                                   (cubit.adesnceModel?.data?[index].image.toString() ??
//                                                       ''),
//                                               errorBuilder: (context, error, stackTrace) {
//                                                 return Image.asset('assets/images/chair.jpg');
//                                               },
//                                             );
//                                           }),
//                                     )
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(3.0),
//                                       child: Container(
//                                         height: 50.h,
//                                         padding: const EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           color: Colors.white60,
//                                           borderRadius: BorderRadius.circular(200),
//                                           border: Border.all(
//                                             color: Colors.black.withOpacity(.3),
//                                             width: 2,
//                                           ),
//                                         ),
//                                         child: Image.network(
//                                           EndPoints.baseUrlImage +
//                                               (cubit.adesnceModel?.data?[0].image
//                                                   .toString() ??
//                                                   ''),
//                                           errorBuilder: (context, error, stackTrace) {
//                                             return Image.asset('assets/images/chair.jpg');
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                     Flexible(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           crossAxisAlignment: CrossAxisAlignment
//                                               .start, // Align children to the start
//                                           children: [
//                                             Text("birthday".tr(),
//                                                 style: Styles.style18.copyWith(
//                                                     color: AppColors.secondPrimary)),
//                                             Text(
//                                               (EasyLocalization.of(context)!
//                                                   .locale
//                                                   .languageCode ==
//                                                   'ar')
//                                                   ? (cubit.adesnceModel?.data?[0]
//                                                   .descriptionAr ??
//                                                   '')
//                                                   : (cubit.adesnceModel?.data?[0]
//                                                   .descriptionEn ??
//                                                   ''),
//                                               maxLines: 2,
//                                               textAlign: TextAlign.start,
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             Text("advertisement".tr(),
//                                                 style: Styles.style18.copyWith(
//                                                     color: AppColors.secondPrimary)),
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//
//                   )
//                       : selectedCategoryIndex == 1
//                       ? ListView(
//                     physics: const BouncingScrollPhysics(),
//
//                     shrinkWrap: true,
//
//                     children: [
//                       advertisements(),
//
//                     ],
//                   )
//                       : Container()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
