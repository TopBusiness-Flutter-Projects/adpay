import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/models/get_my_orders_model.dart';
import '../../../../core/models/vendor_order_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/get_size.dart';
import '../cubit/orders_cubit.dart';

class CustomOrderWidget extends StatefulWidget {
  CustomOrderWidget({
     this.orderModel,
    this.item,
    this.onTap,
    super.key,
  });
  OrderData ?orderModel;
  void Function()? onTap;
  VendorOrderData? item;

  @override
  State<CustomOrderWidget> createState() => _CustomOrderWidgetState();
}

class _CustomOrderWidgetState extends State<CustomOrderWidget> {
  // void initState() {
  //   super.initState();
  //
  //   // Use read method from context in initState
  //
  //   context.read<OrdersCubit>().GetOrders();
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300.h,
      margin: EdgeInsets.only(top: getSize(context) / 40),
      decoration: BoxDecoration(
          color: widget.item?.vendor != null
              ? AppColors.primary.withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(getSize(context) / 44),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ]),
      // didnt have scroll
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/ordernumber.png"),
              ),
              Text("ordernum".tr()),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("#${widget.item?.reference ?? '235345435'}"),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/calender.png"),
              ),
              Text(
                  "${DateFormat('yyyy/MM/dd').format(widget.item?.createdAt ?? DateTime.now())}"),
              SizedBox(
                width: 30.w,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/watch.png"),
              ),
              Text(
                  "${DateFormat('hh:mm a').format(widget.item?.createdAt ?? DateTime.now())}"),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/grage.png"),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                      "${'total'.tr()}: ${widget.item?.total.toString() ?? '0'}")),
              widget.item?.vendor != null
                  ? Container()
                  : Row(children: [
                      InkWell(
                        onTap: widget.onTap ??
                            () {
                            },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "details".tr(),
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Image.asset("assets/images/forwarddetails.png"),
                      )
                    ])
            ],
          ),
        ],
      ),
    );
  }
}
