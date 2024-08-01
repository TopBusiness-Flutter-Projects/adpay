
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adpay/core/utils/styles.dart';
import 'package:adpay/features/home_screen/presentation/salla/cubit/salla_cubit.dart';
import 'package:adpay/core/models/get_cart_model.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/core/utils/app_colors.dart';
import '../../../../../core/utils/hex_color.dart';

class SallaScreen extends StatefulWidget {
  const SallaScreen({Key? key}) : super(key: key);

  @override
  State<SallaScreen> createState() => _SallaScreenState();
}

class _SallaScreenState extends State<SallaScreen> {
  @override
  void initState() {
    context.read<SallaCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SallaCubit, SallaState>(
      builder: (context, state) {
        var cubit = context.read<SallaCubit>();
        return SafeArea(
          child: Scaffold(
            body: state is SallaLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      "basket".tr(),
                      style: Styles.style20.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: cubit.cartModel == null || cubit.cartModel!.data == null || cubit.cartModel!.data!.isEmpty
                      ? Center(
                    child: Text("No items in cart"),
                  )
                      : ListView.builder(
                    itemCount: cubit.cartModel!.data!.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var model = cubit.cartModel!.data![index];
                      return CustomCartWidget(model: model);
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "total".tr(),
                            style: Styles.style16.copyWith(color: Colors.black),
                          ),
                          Text(
                            cubit.getTotalPrice.abs().toString(),
                            style: Styles.style16.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: Text(
                                  "cancel".tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  cubit.onTapConfirm(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.secondPrimary,
                                ),
                                child: Text(
                                  "completeorder".tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomCartWidget extends StatelessWidget {
  final GetCartModelData model;

  const CustomCartWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SallaCubit>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: getSize(context),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.01),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: getSize(context) / 8,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: getSize(context) / 8),
                itemBuilder: (BuildContext context, int index) {
                  var cartItem = model.carts![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.09),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/logo.png"),
                          ),
                          Column(
                            children: [
                              Text(cartItem.name ?? ""),
                              Container(
                                height: 30.h,
                                margin: EdgeInsets.only(top: getSize(context) / 24),
                                width: getSize(context) / 2.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.red, width: 2.0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cubit.increment(item: model, model: cartItem);
                                      },
                                      child: Image.asset("assets/images/add.png"),
                                    ),
                                    Text(
                                      cartItem.qty.toString(),
                                      style: TextStyle(fontSize: 24.0),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cubit.decrement(item: model, model: cartItem);
                                      },
                                      child: Image.asset("assets/images/minus.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(cartItem.price.toString()),
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.postDelete(
                                    item: model,
                                    product_id: cartItem.productId.toString(),
                                    user_id: cartItem.userId.toString(),
                                  );
                                },
                                child: Icon(Icons.delete_outline, color: AppColors.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: model.carts!.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total".tr(),
                    style: Styles.style16.copyWith(color: Colors.black),
                  ),
                  Text(
                    model.total.abs().toString(),
                    style: Styles.style16.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
