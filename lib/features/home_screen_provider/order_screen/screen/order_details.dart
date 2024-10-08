import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/features/home_screen_provider/order_screen/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../home_screen/orders/widget/custom_order_widget.dart';
import '../../../urllaunch.dart';
import '../cubit/state.dart';

class OrderDetailsVendor extends StatefulWidget {
  OrderDetailsVendor({this.id, super.key});
  String? id;
  @override
  State<OrderDetailsVendor> createState() => _OrderDetailsVendorState();
}

class _OrderDetailsVendorState extends State<OrderDetailsVendor> {
  @override
  void initState() {
    context.read<VendorOrderCubit>().getVendorOrderDetails(widget.id ?? '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorOrderCubit, VendorOrderState>(
      builder: (context, state) {
        var cubit = context.read<VendorOrderCubit>();
        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                'order_details'.tr(),
                style: TextStyle(
                    color: AppColors.grayColor, fontWeight: FontWeight.w700),
              ),
            ),
            body: (state is LoadingGetDetailsOrdersVendor ||
                    cubit.detailsModel == null)
                ? Center(child: RefreshProgressIndicator())
                : ListView(
                    padding: EdgeInsets.all(getSize(context) / 32),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius:
                                BorderRadius.circular(getSize(context) / 44),
                            border: Border.all(
                              color: Colors
                                  .grey[300]!, // Set the color of the border
                              width: 2.0, // Set the width of the border
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors
                                          .red, // Set the border color here
                                      width: 1, // Set the border width here
                                    ),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        getSize(context),
                                      ), //
                                      child: Image.network(
                                        cubit.detailsModel?.data?.vendor
                                                ?.image ??
                                            '',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/chair.jpg',
                                            scale: 10,
                                          );
                                        },
                                      )),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Text(
                                          cubit.detailsModel?.data?.vendor?.name
                                                  .toString() ??
                                              "",
                                          style: TextStyle(
                                              color: AppColors.secondPrimary,
                                              fontSize: getSize(context) / 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    CallIcon(
                                      phoneNumber: cubit
                                              .detailsModel?.data?.vendor?.phone
                                              .toString() ??
                                          '001122',
                                    ),
                                    SizedBox(width: 6.w),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.chatapp,
                                        );
                                      },
                                      child: Image.asset(
                                          "assets/images/typing.png"),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomOrderWidget(
                        item: cubit.detailsModel?.data,
                        onTap: () {
                          //!20000000
                        },
                      ),
                      SizedBox(height: 5.h),
                      ListView.builder(
                        padding: EdgeInsets.only(top: getSize(context) / 32),
                        shrinkWrap: true,
                        itemCount: cubit.detailsModel!.data!.details!.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: getSize(context) / 4,
                            padding: EdgeInsets.all(getSize(context) / 44),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getSize(context) / 44),
                                color: AppColors.white,
                                border: Border.all(
                                  width: 0.2,
                                  color: AppColors.grayColor,
                                )),
                            child: Row(
                              children: [
                                Image.network(
                                  cubit.detailsModel!.data!.details![index]
                                          .product!.images?.first ??
                                      '',
                                  width: getSize(context) / 6,
                                  height: getSize(context) / 6,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/teshirt.png',
                                      width: getSize(context) / 6,
                                      height: getSize(context) / 6,
                                    );
                                  },
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: Text(
                                                  EasyLocalization.of(context)!
                                                              .currentLocale!
                                                              .languageCode ==
                                                          'ar'
                                                      ? cubit
                                                              .detailsModel
                                                              ?.data
                                                              ?.details![index]
                                                              .product
                                                              ?.titleAr ??
                                                          ''
                                                      : cubit
                                                              .detailsModel
                                                              ?.data
                                                              ?.details![index]
                                                              .product
                                                              ?.titleEn ??
                                                          ''.toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .secondPrimary,
                                                      fontSize:
                                                          getSize(context) / 20,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            ),
                                            Text(
                                                "${AppStrings.currency} ${cubit.detailsModel!.data!.details![index].product!.price.toString()}",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize:
                                                        getSize(context) / 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          "${'count'.tr()} : ${cubit.detailsModel!.data!.details![index].qty.toString()}",
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: AppColors.secondPrimary,
                                              fontSize: getSize(context) / 20,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
            bottomSheet: (state is LoadingGetDetailsOrdersVendor ||
                    cubit.detailsModel == null)
                ? Container(
                    height: 0,
                    width: 0,
                  )
                : (cubit.detailsModel?.data?.type == 'complete')
                    ? Container(
                        height: 0,
                        width: 0,
                      )
                    : (cubit.detailsModel?.data?.type == 'cancelled')
                        ? GestureDetector(
                            onTap: () {
                              cubit.changVendorOrderStatus(
                                  type: 'pending',
                                  id: cubit.detailsModel!.data!.id.toString(),
                                  context: context);
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              height: getSize(context) / 8,
                              margin: EdgeInsets.all(getSize(context) / 44),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getSize(context) / 32),
                                color: AppColors.primary,
                              ),
                              child: Text(
                                'resend_order'.tr(),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: getSize(context) / 20,
                                ),
                              ),
                            ),
                          )
                        : (cubit.detailsModel!.data?.type == 'new')
                            ? GestureDetector(
                                onTap: () {
                                  cubit.changVendorOrderStatus(
                                      type: 'pending',
                                      id: cubit.detailsModel!.data!.id
                                          .toString(),
                                      context: context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  height: getSize(context) / 8,
                                  margin: EdgeInsets.all(getSize(context) / 44),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getSize(context) / 32),
                                    color: AppColors.primary,
                                  ),
                                  child: Text(
                                    'send_order'.tr(),
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: getSize(context) / 20,
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.changVendorOrderStatus(
                                            type: 'cancelled',
                                            id: cubit.detailsModel!.data!.id
                                                .toString(),
                                            context: context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        height: getSize(context) / 8,
                                        margin: EdgeInsets.all(
                                            getSize(context) / 44),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getSize(context) / 32),
                                          color: AppColors.secondPrimary,
                                        ),
                                        child: Text(
                                          'reset_ordre'.tr(),
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: getSize(context) / 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.changVendorOrderStatus(
                                            type: 'complete',
                                            id: cubit.detailsModel!.data!.id
                                                .toString(),
                                            context: context);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        height: getSize(context) / 8,
                                        margin: EdgeInsets.all(
                                            getSize(context) / 44),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getSize(context) / 32),
                                          color: AppColors.primary,
                                        ),
                                        child: Text(
                                          'complete_order'.tr(),
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: getSize(context) / 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
      },
    );
  }
}
