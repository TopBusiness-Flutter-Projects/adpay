import 'package:adpay/core/utils/app_strings.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/features/home_screen_provider/add_new_product/cubit/cubit.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/state.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/cubit.dart';

class ProductDetailsVendorScreen extends StatefulWidget {
  ProductDetailsVendorScreen({super.key, this.id});
  String? id;
  @override
  State<ProductDetailsVendorScreen> createState() =>
      _ProductDetailsVendorScreenState();
}

class _ProductDetailsVendorScreenState
    extends State<ProductDetailsVendorScreen> {
  void initState() {
    super.initState();
    context.read<MainVendorCubit>().getProductsDetils(id: widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainVendorCubit, MainVendorState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text("Productdetails".tr(),
                style: Styles.style20.copyWith(color: Colors.black)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 400.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height *
                                    0.5 /
                                    3,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    //   color: Color(0xfff6f6f6),
                                    color: Colors.white,
                                    // color:Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Swiper(
                                    autoplay: true,
                                    itemCount: cubit.productsModelDetails?.data?.images?.length ??
                                        1,
                                    pagination: const SwiperPagination(
                                      alignment: Alignment.bottomCenter,
                                      builder: DotSwiperPaginationBuilder(
                                        color: Colors.grey,
                                        activeColor: Color(0xff205960),
                                      ),
                                    ),
                                    duration: 600,
                                    itemBuilder: (context, index) {
                                      return Image.network(
                                        (cubit.productsModelDetails?.data
                                                ?.images?[index]
                                                .toString() ??
                                            'assets/images/chair.jpg'),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                              'assets/images/chair.jpg');
                                        },
                                      );
                                      // Image.asset(
                                      //     'assets/images/chair.jpg');
                                    }),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Align children to the start
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Text(
                                                (EasyLocalization.of(context)!
                                                            .locale
                                                            .languageCode ==
                                                        'ar')
                                                    ? (cubit.productsModelDetails
                                                            ?.data?.titleAr ??
                                                        'arabic')
                                                    : (cubit.productsModelDetails
                                                            ?.data?.titleEn ??
                                                        'english'),
                                                style: Styles.style18.copyWith(
                                                    color: AppColors
                                                        .secondPrimary)),
                                          ),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Flexible(
                                                  child: Text(
                                                "${cubit.productsModelDetails?.data?.price.toString() ?? "T-Shirt"} ${AppStrings.currency}",
                                                style: Styles.style16,
                                              )))
                                        ],
                                      ),
                                      Text(
                                        (EasyLocalization.of(context)!
                                                    .locale
                                                    .languageCode ==
                                                'ar')
                                            ? (cubit.productsModelDetails?.data
                                                    ?.descriptionAr ??
                                                'arabic')
                                            : (cubit.productsModelDetails?.data
                                                    ?.descriptionEn ??
                                                'english'),
                                        // (EasyLocalization.of(context)!.locale.languageCode == 'ar') ? (cubit.adesnceModel?.data?[0].descriptionAr ?? '') : (cubit.adesnceModel?.data?[0].descriptionEn ?? ''),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                          (EasyLocalization.of(context)!
                                                      .locale
                                                      .languageCode ==
                                                  'ar')
                                              ? (cubit.productsModelDetails
                                                      ?.data?.shopSubCat ??
                                                  'arabic')
                                              : (cubit.productsModelDetails
                                                      ?.data?.shopSubCat ??
                                                  'english'),
                                          style: Styles.style18.copyWith(
                                              color: AppColors.secondPrimary)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 2.0.sp,
                              color: Colors.grey[300]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getSize(context) / 12)
              ],
            ),
          ),
          bottomSheet: Container(
            height: getSize(context) / 8,
            padding: EdgeInsets.all(getSize(context) / 66),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //!

                GestureDetector(
                  onTap: () {
                    context
                        .read<AddNewProductCubit>()
                        .onTapToUpdate(cubit.productsModelDetails, context);
                    //!
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getSize(context) / 66),
                    width: getSize(context) / 2.3,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 32),
                      color: AppColors.secondPrimary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Icon(
                            Icons.edit,
                            color: AppColors.white,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'edit_product'.tr(),
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //!

                    cubit.vendorDeleteProduct(
                        context: context,
                        id: cubit.productsModelDetails?.data!.id ?? 1);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getSize(context) / 66),
                    width: getSize(context) / 2.3,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 32),
                      color: AppColors.primary,
                    ),
                    child: (state is LoadingDeleteProductsDetails)
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Icon(
                                  CupertinoIcons.delete_solid,
                                  color: AppColors.white,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'delete_product'.tr(),
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
