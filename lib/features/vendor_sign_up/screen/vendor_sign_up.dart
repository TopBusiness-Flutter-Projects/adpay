import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/features/vendor_sign_up/cubit/cubit.dart';
import 'package:adpay/features/vendor_sign_up/cubit/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/tab_widget.dart';

class VendorSignupScreen extends StatefulWidget {
  const VendorSignupScreen({super.key});

  @override
  State<VendorSignupScreen> createState() => _VendorSignupScreenState();
}

class _VendorSignupScreenState extends State<VendorSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpVendorCubit, SignUpVendorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<SignUpVendorCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'signup'.tr(),
              style: TextStyle(color: AppColors.grayColor),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        cubit.setSignUpPageType(true);
                        print(cubit.isPersonalType);
                      },
                      child: SignUpTabBar(
                          isRight: true,
                          departmentName: 'personal_info'.tr(),
                          isSelected: cubit.isPersonalType)),
                  GestureDetector(
                      onTap: () {
                        cubit.setSignUpPageType(false);
                        print(cubit.isPersonalType);
                      },
                      child: SignUpTabBar(
                          isRight: false,
                          departmentName: 'market_info'.tr(),
                          isSelected: !cubit.isPersonalType)),
                ],
              ),
              Flexible(
                  child: cubit.isPersonalType
                      ? Center(
                          child: Text('personal_info'.tr()),
                        )
                      : Center(
                          child: Text('market_info'.tr()),
                        ))
            ],
          ),
        );
      },
    );
  }
}
