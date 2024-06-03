import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/get_size.dart';

class CustomHomeScreenWidget extends StatelessWidget {
  CustomHomeScreenWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.count,
  });
  String imagePath;
  String title;
  String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getSize(context) / 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getSize(context) / 22),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(1, 0.5),
                spreadRadius: 0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: getSize(context) / 16,
                child: CircleAvatar(
                  radius: getSize(context) / 22,
                  backgroundImage: AssetImage(
                    imagePath,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: Text(
                  count,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Text(
              ' $title ',
              maxLines: 1,
              style: TextStyle(
                color: const Color(0xff747474),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
