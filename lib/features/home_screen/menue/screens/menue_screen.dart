import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/features/home_screen/menue/screens/widgets/menue_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/styles.dart';

class MenueScreen extends StatelessWidget {
  const MenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
        child: Column(
        children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(

              title: Text("menue".tr(),
                  style: Styles.style20.copyWith(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
            //  width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color:AppColors.shadeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text("Mydata".tr(),style: Styles.style16,),),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.profile);
            },
              child: MenueWidget(text: 'Profilepersonly'.tr(), path: 'assets/images/profile2.png')),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.messagescreen);            },
              child: MenueWidget(text: 'Mymessages'.tr(), path: 'assets/images/message2.png')),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.addharag);
            },
              child: MenueWidget(text: 'AddHaraj'.tr(), path: 'assets/images/Harag.png')),
          InkWell(
    onTap: () {
      Navigator.pushNamed(context, Routes.favouritescreen);
    },
              child: MenueWidget(text: 'Favorite'.tr(), path: 'assets/images/favourite.png')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              //  width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color:AppColors.shadeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text("Settings".tr(),style: Styles.style16,),),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.contactus);
            },
              child: MenueWidget(text: 'contactus'.tr(), path: 'assets/images/contactus.png')),
          MenueWidget(text: 'aboutapp'.tr(), path: 'assets/images/i.png'),
          MenueWidget(text: 'Terms'.tr(), path: 'assets/images/verified.png'),
          MenueWidget(text: 'Shareapp'.tr(), path: 'assets/images/share.png'),
          MenueWidget(text: 'evaluation'.tr(), path: 'assets/images/evaluation.png'),
          MenueWidget(text: 'Logout'.tr(), path: 'assets/images/logout.png'),
        ]
    )
    )
    )
    );
  }
}
