import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/home/home_cubit.dart';
import '../controller/home/home_state.dart';
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
        Padding(
            padding: const EdgeInsets.all(10),
            child:Icon(Icons.notifications)
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
