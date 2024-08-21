import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/app_routes.dart';

class CompleteOrder extends StatelessWidget {
  const CompleteOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Image.asset("assets/images/box.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("completedsuccessfully".tr()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0,vertical: 10.0),
            child: Text("happytodeal".tr(),maxLines: 2,),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.float );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color of the button to red
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Center(
                child: Text('mainpage'.tr(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0.sp)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
