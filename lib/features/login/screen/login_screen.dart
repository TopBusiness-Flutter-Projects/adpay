import 'package:adpay/config/routes/app_routes.dart';
import 'package:adpay/features/login/cubit/cubit.dart';
import 'package:adpay/features/login/cubit/state.dart';
import 'package:adpay/features/login/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
        if (state is LoadingLoginAuth) {
          EasyLoading.show(status: 'loading...');
        }   else if (state is LoadedLoginAuth) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Login Success');
        } else if (state is ErrorLoginAuth) {
          EasyLoading.showError("state.toString()");
        }
      },
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'login'.tr(),
              style: TextStyle(
                  color: AppColors.grayColor, fontWeight: FontWeight.w700),
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
              SizedBox(
                height: getSize(context) / 22,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                  //!
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'forget_password'.tr(),
                    style: TextStyle(
                        color: AppColors.secondPrimary,
                        fontWeight: FontWeight.w400,
                        fontSize: getSize(context) / 28),
                  ),
                ),
              ),
              SizedBox(height: getSize(context) / 12),
              GestureDetector(
                onTap: () {
                  print("screen");
               //   cubit.loginAuth(context);
                  cubit.CheckUser(context);
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: getSize(context) / 22),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: getSize(context) / 22, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      'login'.tr(),
                      style: TextStyle(
                          color: Colors.white, fontSize: getSize(context) / 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getSize(context) / 6),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${'don\'t_have_an_account'.tr()} ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: getSize(context) / 24),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.vendorSignUp);

                        //TODO:  nav to signup
                      },
                      child: Text(
                        'signup'.tr(),
                        style: TextStyle(
                            color: AppColors.secondPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: getSize(context) / 24),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
