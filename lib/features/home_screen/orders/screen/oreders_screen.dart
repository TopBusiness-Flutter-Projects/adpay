import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/orders_cubit.dart';
import '../widget/custom_order_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  void initState() {
    super.initState();
     context.read<OrdersCubit>().GetOrders();
  }
  bool? colors = true;
  bool colors2 = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
      var cubit = context.read<OrdersCubit>();
    return Scaffold(

        body:
        (state is OrdersLoading)
            ? Center(
          child: CircularProgressIndicator(),
        )
            :
        Column(
            children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text("orders".tr(),
              style: Styles.style20.copyWith(color: Colors.black)),
        ),
      ),
      Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {

        cubit.onChangeUserOrder('complete');              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                width: getSize(context) / 3,
                decoration: BoxDecoration(
                  color: cubit.currentUserOrder=='complete'
                      ? AppColors.primary
                      : AppColors.gray,
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
                      fontSize: 16.sp,
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
                cubit.onChangeUserOrder('new');
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                width: getSize(context) / 3,
                decoration: BoxDecoration(
                  color:cubit.currentUserOrder=='new'                      ?
                  AppColors.primary
                      : AppColors.gray,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'new_orders'.tr(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Flexible(
        child: Container(
          child:( cubit.getMyOrderModel!.data!.isEmpty)?
              Center(
                child:Text('no_data'.tr()),
              )
              : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),

                child: CustomOrderWidget(
                  orderModel: cubit.getMyOrderModel!.data?[index], onTap: () {
                    print('...............${cubit.getMyOrderModel?.data?[index].id.toString()}');
                  Navigator.pushNamed(
                      context, Routes.orderDetails,
                      arguments: cubit.getMyOrderModel?.data?[index].id.toString());
                  //!20000000
                },),
              );
            },
            itemCount: cubit.getMyOrderModel!.data!.length
          ),
        ),
      ),
    ]));
  }
    );}}
