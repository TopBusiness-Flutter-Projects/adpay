import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/app_strings.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class WalletVendorScreen extends StatefulWidget {
  const WalletVendorScreen({super.key});

  @override
  State<WalletVendorScreen> createState() => _WalletVendorScreenState();
}

class _WalletVendorScreenState extends State<WalletVendorScreen> {
  @override
  void initState() {
    context.read<MainVendorCubit>().myWalletVendorModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.black,
            centerTitle: false,
            title: Text(
              'wallety'.tr(),
              style: TextStyle(
                color: AppColors.black,
                fontSize: getSize(context) / 20,
              ),
            ),
          ),
          body: (cubit.myWalletVendor == null)
              ? Center(
                  child: RefreshProgressIndicator(color: AppColors.primary),
                )
              : Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      Hero(
                        tag: 'wallet_vendor',
                        child: Container(
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          width: getSize(context) / 3,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.circular(getSize(context) / 44),
                              border: Border.all(
                                  color: AppColors.greyColor, width: 0.3),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyColor,
                                  offset: Offset(1, 1),
                                )
                              ]),
                          child: Column(
                            children: [
                              Text(
                                'myCredit'.tr(),
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        "${cubit.myWalletVendor!.data!.balanceWallet.toString()} ",
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${AppStrings.currency}",
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(getSize(context) / 22),
                        child: Text(
                          'last_transfer'.tr(),
                          style: TextStyle(
                            color: AppColors.secondPrimary,
                            fontSize: getSize(context) / 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        fit: FlexFit.tight,
                        child: ListView.builder(
                          itemCount:
                              cubit.myWalletVendor!.data!.history?.length,
                          padding: EdgeInsets.symmetric(
                              vertical: getSize(context) / 22, horizontal: 8),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item =
                                cubit.myWalletVendor!.data!.history?[index];
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                      getSize(context) / 44),
                                  border: Border.all(
                                      color: AppColors.greyColor, width: 0.3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.greyColor,
                                      offset: Offset(1, 1),
                                    )
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/my_wallet.png',
                                    width: getSize(context) / 6,
                                    height: getSize(context) / 6,
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item?.type ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          item?.createdAt ??
                                              DateFormat('yyyy-MM-dd hh:mm a')
                                                  .format(DateTime.now()),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "${item?.amount.toString()} ",
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${AppStrings.currency}",
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
