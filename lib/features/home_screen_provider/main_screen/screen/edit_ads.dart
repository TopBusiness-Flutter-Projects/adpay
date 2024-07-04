import 'dart:io';

import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/features/home_screen_provider/edit_product/widget/text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/get_size.dart';
import '../../add_new_ads/cubit/cubit.dart';
import '../../add_new_ads/cubit/state.dart';
import '../../add_new_ads/screen/package_widget.dart';
import '../cubit/cubit.dart';


class EditAdsence extends StatefulWidget {
   EditAdsence({super.key, required this.id});
String id;
  @override
  State<EditAdsence> createState() => _EditAdsenceState();
}

final formKey = GlobalKey<FormState>();

class _EditAdsenceState extends State<EditAdsence> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id+"newwwww");

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewAdsCubit, AddNewAdsState>(
      builder: (context, state) {
        var cubit = context.read<AddNewAdsCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'edit_ads'.tr(),
              style: TextStyle(color: AppColors.black),
            ),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Advertisementimage".tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          context.read<MainVendorCubit>().adsVendorModel?.data?.first?.image==null?
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                  onTap: () {
                                    cubit.pickLogoImage();
                                  },
                                  child:
                                  Container(
                                      height: getSize(context) / 6,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          cubit.selectedImage ?? File(''),
                                          height: getSize(context) / 6,
                                          width: getSize(context) / 1.2,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                "assets/images/uploadimages.png");
                                          },
                                        ),
                                      ))),
                            ),
                          ):
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                  onTap: () {
                                    cubit.pickLogoImage();
                                  },
                                  child:
                                  Container(
                                      height: getSize(context) / 6,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.file(
                                          cubit.selectedImage ?? File(''),
                                          height: getSize(context) / 6,
                                          width: getSize(context) / 1.2,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.network( context.read<MainVendorCubit>().adsVendorModel?.data?.first.image.toString()??"");
                                          },
                                        ),
                                      ))),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "video_title".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomAddNewProductField(
                    controller: cubit.videoLinkController2,
                    hintText: context.read<MainVendorCubit>().adsVendorModel?.data?.first.video.toString(),
                    keyboardType: TextInputType.name,
                    mssage: 'please_enter_data'.tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "productname".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomAddNewProductField(
                    controller: cubit.nameController2,
                    hintText:  context.read<MainVendorCubit>().adsVendorModel?.data?.first.titleAr,
                    keyboardType: TextInputType.name,
                    mssage: 'please_enter_data'.tr(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "Productdetails".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomAddNewProductField(
                    controller: cubit.discriptoionController2,
                    hintText: context.read<MainVendorCubit>().adsVendorModel?.data?.first.descriptionAr,
                    keyboardType: TextInputType.text,
                    mssage: 'please_enter_data'.tr(),
                    maxLines: 3,
                  ),

                  ///! Packages
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "package".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AdPackageWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Center(
                      child: SizedBox(
                        width: 250.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (cubit.selectedImage != null) {
                                cubit.editAds(context,id:widget.id);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Productimage'.tr());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: Center(
                            child: (state is LoadingAddNewAd)
                                ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                                : Text(
                              "editt".tr(),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
