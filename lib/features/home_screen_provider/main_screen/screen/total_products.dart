import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            title: Hero(
              tag: 'total_products',
              child: Text(
                'products'.tr(),
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: getSize(context) / 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            cubit.currentTotalProductsIndex = 0;
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
                                : AppColors.secondPrimary,
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
                                : AppColors.secondPrimary,
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
              (state is LoadingGetShopCategoryVendorState)
                  ? Container()
                  : Container(
                      height: getSize(context) / 6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.shopCategoryVendorModel?.data?.length,
                        itemBuilder: (context, index) {
                          var item =
                              cubit.shopCategoryVendorModel?.data?[index];
                          return Container(
                            child: Text(
                              item?.titleAr ?? '',
                              style: TextStyle(
                                color: AppColors.black,
                              ),
                            ),
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
