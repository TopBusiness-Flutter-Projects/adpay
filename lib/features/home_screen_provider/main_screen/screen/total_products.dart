import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_screen/component/custom_product_widget.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class TotalProductsVendorScreen extends StatefulWidget {
  const TotalProductsVendorScreen({super.key});

  @override
  State<TotalProductsVendorScreen> createState() =>
      _TotalProductsVendorScreenState();
}

class _TotalProductsVendorScreenState extends State<TotalProductsVendorScreen> {
  @override
  void initState() {
    context.read<MainVendorCubit>().getVendorGetShopCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'products'.tr(),
              style: TextStyle(
                color: AppColors.black,
                fontSize: getSize(context) / 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: getSize(context) / 6,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            cubit.currentTotalProductsIndex = 0;
                            cubit.getTotalProductsVendor();
                          });
                        },
                        child: Container(
                          height: getSize(context) / 9,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                          width: getSize(context) / 3,
                          decoration: BoxDecoration(
                            color: cubit.currentTotalProductsIndex == 0
                                ? AppColors.primary
                                : AppColors.greyColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'used_products'.tr(),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            cubit.currentTotalProductsIndex = 1;
                            cubit.getTotalProductsVendor();
                            //! get
                          });
                        },
                        child: Container(
                          height: getSize(context) / 9,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                          width: getSize(context) / 3,
                          decoration: BoxDecoration(
                            color: cubit.currentTotalProductsIndex == 1
                                ? AppColors.primary
                                : AppColors.greyColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'new_products'.tr(),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (state is LoadingGetShopCategoryVendorState ||
                      cubit.shopCategoryVendorModel == null)
                  ? Container()
                  : Container(
                      height: getSize(context) / 12,
                      width: getSize(context),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.shopCategoryVendorModel?.data.length,
                        itemBuilder: (context, index) {
                          var item = cubit.shopCategoryVendorModel?.data[index];
                          return GestureDetector(
                            onTap: () {
                              cubit.onChangeCategory(item!);
                            },
                            child: Container(
                              height: getSize(context) / 12,
                              margin: EdgeInsets.symmetric(
                                horizontal: getSize(context) / 44,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: getSize(context) / 44,
                              ),
                              decoration: BoxDecoration(
                                color: (cubit.currentSelectedCategory?.id ==
                                        item?.id)
                                    ? AppColors.primary
                                    : AppColors.white,
                                border: Border.all(
                                  color: AppColors.greyColor,
                                  width: 1,
                                ),
                                // boxShadow: [BoxShadow(offset: Offset(1, 1))],
                                borderRadius: BorderRadius.circular(
                                    getSize(context) / 32),
                                // color: AppColors.red,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                item?.titleAr ?? '',
                                style: TextStyle(
                                  color: (cubit.currentSelectedCategory?.id ==
                                          item?.id)
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              (state is LoadingGetProductsOfVendorState)
                  ? Center(child: RefreshProgressIndicator())
                  : Flexible(
                      fit: FlexFit.tight,
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 15, right: 8, left: 8),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1 / 1),
                        physics: const BouncingScrollPhysics(),
                        itemCount: cubit.allProductsModel?.data?.length,
                        itemBuilder: (context, index) {
                          return CustomProductWidget(
                            isVendor: true,
                            product: cubit.allProductsModel?.data?[index],
                          );
                        },
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
