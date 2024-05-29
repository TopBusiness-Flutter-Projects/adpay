import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';

import '../../../../core/utils/styles.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
        child: Column(
        children: [
        ListTile(
        leading: InkWell(
        onTap: () {
      Navigator.pop(context);
    },
    child: Icon(Icons.arrow_back),
    ),
    title: Text(
    "messages".tr(),
    style: Styles.style20.copyWith(color: Colors.black),
    ),
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Change this to your desired border color
                    width: 1.0, // Adjust the width of the border as needed
                  ),
                  borderRadius: BorderRadius.circular(200), // Same border radius as ClipRRect
                ),
                child:
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(200),
                //   child: Image.asset(
                //     "assets/images/chair.jpg",
                //     scale: 11,
                //   ),
                // ),
                // Badge(
                //   backgroundColor: AppColors.primary,
                //   child:
                //   ClipRRect(
                //     borderRadius: BorderRadius.circular(200),
                //     child: Image.asset(
                //       "assets/images/chair.jpg",
                //       scale: 11,
                //     ),
                //   ),
                // )
                Badge(
                  alignment:Alignment.bottomLeft,
                  backgroundColor: AppColors.secondPrimary, // Use your AppColors.primary here
                    textColor:AppColors.white,
                  textStyle: Styles.style12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      "assets/images/chair.jpg",
                      scale: 11,
                    ),
                  ),
                  label: Center(child: Container(
                    child: Text('2'),)), // Add this line

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("متجر سيارات",style:TextStyle(color:Colors.black)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" AM 2:12"),
              )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Change this to your desired border color
                    width: 1.0, // Adjust the width of the border as needed
                  ),
                  borderRadius: BorderRadius.circular(200), // Same border radius as ClipRRect
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/images/chair.jpg",
                    scale: 11,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("متجر سيارات",style:TextStyle(color:Colors.black)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" AM 2:12"),
              )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Change this to your desired border color
                    width: 1.0, // Adjust the width of the border as needed
                  ),
                  borderRadius: BorderRadius.circular(200), // Same border radius as ClipRRect
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.asset(
                    "assets/images/chair.jpg",
                    scale: 11,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("متجر سيارات",style:TextStyle(color:Colors.black)),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" AM 2:12"),
              )
            ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Divider(),
          ),
        ])
    ))
    );
  }
}
