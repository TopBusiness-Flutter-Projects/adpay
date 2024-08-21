import 'package:adpay/features/home_screen_provider/order_screen/cubit/cubit.dart';
import 'package:adpay/features/home_screen_provider/order_screen/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/get_size.dart';
import '../../../home_screen/orders/widget/custom_order_widget.dart';

class OrderScreenVendor extends StatefulWidget {
  const OrderScreenVendor({super.key});

  @override
  State<OrderScreenVendor> createState() => _OrderScreenVendorState();
}

class _OrderScreenVendorState extends State<OrderScreenVendor> {
  @override
  void initState() {
    context.read<VendorOrderCubit>().getVendorOrders();
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
              'incomplete_orders'.tr(),
              style: TextStyle(
                  color: AppColors.grayColor, fontWeight: FontWeight.w700),
            ),
          ),
          body: (state is LoadingGetOrdersVendor)
              ? Center(
                  child: RefreshProgressIndicator(),
                )
              : cubit.vendorOrdersModel!.data!.isEmpty
                  ? Center(
                      child: Text('no_orders'.tr()),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await cubit.getVendorOrders();
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      cubit.currentOrderIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 6),
                                    width: getSize(context) / 3,
                                    decoration: BoxDecoration(
                                      color: cubit.currentOrderIndex == 0
                                          ? AppColors.primary
                                          : AppColors.secondPrimary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'incomplete_orders'.tr(),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12.sp,
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
                                      cubit.currentOrderIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 6),
                                    width: getSize(context) / 3,
                                    decoration: BoxDecoration(
                                      color: cubit.currentOrderIndex == 1
                                          ? AppColors.primary
                                          : AppColors.secondPrimary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'complete_orders'.tr(),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12.sp,
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
                                      cubit.currentOrderIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 6),
                                    width: getSize(context) / 3,
                                    decoration: BoxDecoration(
                                      color: cubit.currentOrderIndex == 2
                                          ? AppColors.primary
                                          : AppColors.secondPrimary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'refused_order'.tr(),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //header
                          Flexible(
                            fit: FlexFit.tight,
                            child: ListView.builder(
                              itemCount: cubit.currentOrderIndex == 0
                                  ? cubit.vendorOrdersNew.length
                                  : cubit.currentOrderIndex == 1
                                      ? cubit.vendorOrdersComplete.length
                                      : cubit.currentOrderIndex == 2
                                          ? cubit.vendorOrdersCancelled.length
                                          : 0,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              itemBuilder: (context, index) {
                                var item = cubit.currentOrderIndex == 0
                                    ? cubit.vendorOrdersNew[index]
                                    : cubit.currentOrderIndex == 1
                                        ? cubit.vendorOrdersComplete[index]
                                        : cubit.currentOrderIndex == 2
                                            ? cubit.vendorOrdersCancelled[index]
                                            : null;
                                return CustomOrderWidget(
                                  item: item,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.orderDetailsVendor,
                                        arguments: item?.id.toString());
                                    //!20000000
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      )),
        );
      },
    );
  }
}
