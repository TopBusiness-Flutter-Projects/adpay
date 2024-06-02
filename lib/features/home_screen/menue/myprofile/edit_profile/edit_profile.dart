// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart%20';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../../core/utils/styles.dart';
// import '../../../../../core/utils/assets_manager.dart';
// import '../../../../../core/utils/get_size.dart';
// import '../../../presentation/widgets/custom_elevated_button.dart';
// class EditProfile extends StatelessWidget {
//   const EditProfile({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 leading: InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.arrow_back),
//                 ),
//                 title: Text("editprofile".tr(), style: Styles.style20.copyWith(color: Colors.black),),
//               ),
//               Stack(
//                 children: [
//                   Center(child:   cubit.selectedImage == null
//                       ? CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: getSize(context) / 8,
//                     backgroundImage: AssetImage(ImageAssets.logoImage),
//                   )
//                       : CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: getSize(context) / 8,
//                     backgroundImage: FileImage(cubit.selectedImage!),
//                   ),),
//                   Positioned(
//                     bottom: 10,
//                     right: 130,
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                         child: InkWell(
//                           onTap: (){
//                             cubit.pickLogoImage(imageName: "user_image");
//                           },
//                             child: Center(child: Image.asset("assets/images/camera.png")))),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Text(
//                   "name".tr(),
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   // controller: ,
//                   onSubmitted: (data) async {},
//                   decoration: InputDecoration(
//                     hintText: "SendMessage".tr(),
//                     filled: true,
//                     fillColor: Colors.white, // Set the background color to white
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 20,
//                       horizontal: 15,
//                     ), // Adjust the content padding
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border colorto grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0,top:10),
//                 child: Text(
//                   "phone".tr(),
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   onSubmitted: (data) async {},
//                   decoration: InputDecoration(
//                     hintText: "SendMessage".tr(),
//                     filled: true,
//                     fillColor: Colors.white, // Set the background color to white
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 20,
//                       horizontal: 15,
//                     ), // Adjust the content padding
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0,top:10),
//                 child: Text(
//                   "NewPassword".tr(),
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   onSubmitted: (data) async {},
//                   decoration: InputDecoration(
//                     hintText: "SendMessage".tr(),
//                     filled: true,
//                     fillColor: Colors.white, // Set the background color to white
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 20,
//                       horizontal: 15,
//                     ), // Adjust the content padding
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0,top:10),
//                 child: Text(
//                   "ConfirmPass".tr(),
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   onSubmitted: (data) async {},
//                   decoration: InputDecoration(
//                     hintText: "SendMessage".tr(),
//                     filled: true,
//                     fillColor: Colors.white, // Set the background color to white
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 20,
//                       horizontal: 15,
//                     ), // Adjust the content padding
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(
//                         color: Colors.grey, // Set the border color to grey
//                         width: 1.0, // Set the border width
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30.h,),
//               CustomElevatedButton(text: 'update'.tr(),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
