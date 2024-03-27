import 'package:adpay/features/login/cubit/cubit.dart';
import 'package:adpay/features/login/cubit/state.dart';
import 'package:adpay/features/login/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/get_size.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.id = 'user', super.key});
  String id;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'login'.tr(),
              style: TextStyle(color: AppColors.grayColor),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: getSize(context) / 16),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: getSize(context) / 22),
                child: Image.asset(
                  widget.id == 'user'
                      ? ImageAssets.appIconImage
                      : ImageAssets.storeIcon,
                  width: getSize(context) / 2.5,
                  height: getSize(context) / 2.5,
                ),
              ),
              CustomTextField(
                controller: cubit.phoneController,
                message: 'enter_phone'.tr(),
                title: 'phone'.tr(),
                hintTitle: 'enter_phone'.tr(),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: getSize(context) / 22,
              ),
              CustomTextField(
                isPass: true,
                onPressed: () {
                  cubit.togglePassword();
                },
                obscureText: cubit.isPassword,
                controller: cubit.passwprdController,
                title: 'password'.tr(),
                hintTitle: 'enter_password'.tr(),
                message: 'enter_password'.tr(),
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
