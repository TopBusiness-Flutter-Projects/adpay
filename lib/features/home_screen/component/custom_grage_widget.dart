import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/models/Home_models.dart';
import '../../../../core/widgets/network_image.dart';

class CustomGrageWidget extends StatelessWidget {
   CustomGrageWidget({super.key, required this.auctions});
  Auctions?auctions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, Routes.gragedetails, arguments:auctions?.id.toString());
        },
        child: Container(
          width: 150.w,
          height: 300.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                Colors.grey.withOpacity(0.005), // Lighter shadow color
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black.withOpacity(0.05), // Lighter shadow color
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: ManageNetworkImage(imageUrl: auctions?.images?.toString()??"",),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.0,right: 5.0),
                child: Text(
                  (EasyLocalization.of(context)!
                      .locale
                      .languageCode ==
                      'ar')
                      ? (auctions?.titleAr ??
                      'تيشيرت')
                      : (auctions?.titleEn ??
                      'T-shirt'),

                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        auctions?.price.toString()??  "",

                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,

                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
