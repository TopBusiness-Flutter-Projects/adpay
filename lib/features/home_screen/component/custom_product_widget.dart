import 'package:adpay/core/models/Home_models.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/network_image.dart';

class CustomProductWidget extends StatelessWidget {
  CustomProductWidget({
    super.key,
    required this.product,
    this.isVendor = false,
  });
  Products? product;
  bool isVendor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (isVendor) {
            Navigator.pushNamed(context, Routes.productDetailsVendorScreen,
                arguments: product?.id.toString() ?? "1");
          } else {
            Navigator.pushNamed(context, Routes.ProductsDetails,
                arguments: product?.id.toString() ?? "1");
          }
        },
        child: Container(
          width: 150.w,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.005), // Lighter shadow color
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
                child: ManageNetworkImage(
                  imageUrl: product?.images?.first ?? "",
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  (EasyLocalization.of(context)!.locale.languageCode == 'ar')
                      ? (product?.titleAr ?? '')
                      : (product?.titleEn ?? ''),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.sp,
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
                        product?.price.toString() ?? "",
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
