// import 'package:adpay/core/utils/assets_manager.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import '../../../core/utils/app_colors.dart';
// import '../../../core/utils/get_size.dart';
// import '../../login/widgets/custom_text_field.dart';
// import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

// import '../../vendor_sign_up/cubit/cubit.dart';

// class StoreInfoWidget extends StatefulWidget {
//   StoreInfoWidget({required this.cubit, super.key});
//   SignUpVendorCubit cubit;
//   @override
//   State<StoreInfoWidget> createState() => _StoreInfoWidgetState();
// }

// class _StoreInfoWidgetState extends State<StoreInfoWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.all(8),
//       children: [
//         SizedBox(height: getSize(context) / 32),
//         Container(
//           child: Text('store_logo'.tr(),
//               style: TextStyle(
//                   color: AppColors.grayColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: getSize(context) / 20)),
//         ),
//         SizedBox(height: getSize(context) / 44),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: getSize(context) / 4.5),
//           child: GestureDetector(
//             onTap: () {
//               widget.cubit.pickLogoImage(imageName: "logoImage");

//               ///
//             },
//             child: Container(
//               height: getSize(context) / 4,
//               width: getSize(context) / 7.8,
//               decoration: BoxDecoration(
//                   border: DashedBorder.fromBorderSide(
//                       dashLength: 15,
//                       side: BorderSide(color: Colors.grey, width: 2)),
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               margin: EdgeInsets.all(5),
//               alignment: Alignment.center,
//               child: widget.cubit.logoImage == null
//                   ? Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(ImageAssets.uImage),
//                         Text('Upload image',
//                             style: TextStyle(fontSize: getSize(context) / 30))
//                       ],
//                     )
//                   : ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       child: Image.file(
//                         widget.cubit.logoImage!,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     ),
//             ),
//           ),
//         ),
//         SizedBox(height: getSize(context) / 44),
//         Container(
//           child: Text('banner_logo'.tr(),
//               style: TextStyle(
//                   color: AppColors.grayColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: getSize(context) / 20)),
//         ),
//         SizedBox(height: getSize(context) / 44),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: getSize(context) / 22),
//           child: GestureDetector(
//             onTap: () {
//               widget.cubit.pickLogoImage(imageName: "bannerImage");

//               ///
//             },
//             child: Container(
//               height: getSize(context) / 4,
//               width: getSize(context) / 8,
//               decoration: BoxDecoration(
//                   border: DashedBorder.fromBorderSide(
//                       dashLength: 15,
//                       side: BorderSide(color: Colors.grey, width: 2)),
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               margin: EdgeInsets.all(5),
//               alignment: Alignment.center,
//               child: widget.cubit.bannerImage == null
//                   ? Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(ImageAssets.uImage),
//                         Text('Upload image',
//                             style: TextStyle(fontSize: getSize(context) / 30))
//                       ],
//                     )
//                   : ClipRRect(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       child: Image.file(
//                         widget.cubit.bannerImage!,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                       ),
//                     ),
//             ),
//           ),
//         ),
//         SizedBox(height: getSize(context) / 32),
//         CustomTextField(
//           controller: widget.cubit.storeNameController,
//           title: 'store_name'.tr(),
//           hintTitle: 'enter_name'.tr(),
//           message: 'enter_store_name'.tr(),
//           keyboardType: TextInputType.name,
//         ),
//         SizedBox(height: getSize(context) / 32),
//         CustomTextField(
//           controller: widget.cubit.adressNameController,
//           title: 'store_adress'.tr(),
//           hintTitle: 'enter_store_adress'.tr(),
//           message: 'enter_store_adress'.tr(),
//           keyboardType: TextInputType.name,
//         ),
//         SizedBox(height: getSize(context) / 32),
//         Container(
//           child: Text('store_category'.tr(),
//               style: TextStyle(
//                   color: AppColors.grayColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: getSize(context) / 20)),
//         ),
//         SizedBox(height: getSize(context) / 88),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: DropdownButtonFormField2<String>(
//             isExpanded: true,
//             decoration: InputDecoration(
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: getSize(context) / 20),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.grayColor),
//                   borderRadius:
//                       BorderRadius.all(Radius.circular(getSize(context) / 44))),
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: AppColors.grayColor),
//                   borderRadius:
//                       BorderRadius.all(Radius.circular(getSize(context) / 44))),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.grayColor),
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(getSize(context) / 44)),
//               ),
//             ),
//             hint: Text(
//               'choose_category'.tr(),
//               style: TextStyle(fontSize: 14),
//             ),
//             items: widget.cubit.genderItems
//                 .map((item) => DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: const TextStyle(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             validator: (value) {
//               if (value == null) {
//                 return 'Please select gender.';
//               }
//               return null;
//             },
//             onChanged: (value) {
//               //Do something when selected item is changed.
//             },
//             onSaved: (value) {
//               widget.cubit.selectedValue = value.toString();
//             },
//             buttonStyleData: const ButtonStyleData(
//               padding: EdgeInsets.only(right: 8),
//             ),
//             iconStyleData: const IconStyleData(
//               icon: Icon(
//                 Icons.arrow_drop_down,
//                 color: Colors.black45,
//               ),
//               iconSize: 24,
//             ),
//             dropdownStyleData: DropdownStyleData(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//                 padding: EdgeInsets.symmetric(horizontal: 16)),
//           ),
//         ),
//         SizedBox(height: getSize(context) / 32),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               child: Text('store_category'.tr(),
//                   style: TextStyle(
//                       color: AppColors.grayColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: getSize(context) / 20)),
//             ),
//             Column(
//               children: [
//                 InkWell(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: AppColors.secondPrimary,
//                         borderRadius:
//                             BorderRadius.circular(getSize(context) / 100)),
//                     child: Icon(Icons.add, color: AppColors.white),
//                   ),
//                 ),
//                 Container(
//                   child: Text('add_sub_categoty'.tr(),
//                       style: TextStyle(
//                           color: AppColors.grayColor,
//                           fontWeight: FontWeight.w500,
//                           fontSize: getSize(context) / 32)),
//                 ),
//               ],
//             )
//           ],
//         ),
//         SizedBox(height: getSize(context) / 32),
//         Container(
//           child: GridView.builder(
//               itemCount: 10,
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//               itemBuilder: (context, index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                       color: AppColors.secondPrimary,
//                       borderRadius:
//                           BorderRadius.circular(getSize(context) / 100)),
//                   child: Text('ملابس'),
//                 );
//               }),
//         ),
//         SizedBox(height: getSize(context) / 32),
//         InkWell(
//           onTap: () {
//             //TODO: sign up
//           },
//           child: Container(
//             margin: EdgeInsets.all(getSize(context) / 22),
//             alignment: Alignment.center,
//             width: double.infinity,
//             height: getSize(context) / 8,
//             decoration: BoxDecoration(
//               color: AppColors.primary,
//               borderRadius: BorderRadius.circular(
//                 getSize(context) / 22,
//               ),
//             ),
//             child: Text(
//               'signup'.tr(),
//               style: TextStyle(
//                 fontSize: getSize(context) / 18,
//                 color: AppColors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
