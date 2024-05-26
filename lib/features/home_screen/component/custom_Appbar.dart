import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/styles.dart';
import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';
import 'custom_icon_appbar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
    builder: (context,state){
    HomeCubit cubit = HomeCubit.get(context);
    return  AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      leading: Container(
        // color: Colors.red,
        padding:  EdgeInsets.symmetric(horizontal:5),
        child:    CustomIconAppBar(
            onTap: () {}, icon: Icons.shopping_cart_outlined),
      ),
      centerTitle: false,
      title:      Text(
      // 'hello '.tr()+${cubit.userData?.data?.name??""},
        'hello'.tr() +" , " +(cubit.userData?.data?.name ?? "nehal"),

        style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
      // leadingWidth: 100,
      actions: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.notificationscreen,);
          },
          child: Padding(
              padding: const EdgeInsets.all(10),
              child:
              // Badge(
              //
              //     child: Icon(Icons.notifications))
              Badge(
                alignment:Alignment.topRight,
                backgroundColor: AppColors.secondPrimary, // Use your AppColors.primary here
                textColor:AppColors.white,
                textStyle: Styles.style12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Icon(Icons.notifications,color:Colors.grey,size: 30,)
                ),
                label: Center(child: Container(
                  child: Text('2'),)), // Add this line

              ),
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "search".tr(),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
    );}
}
