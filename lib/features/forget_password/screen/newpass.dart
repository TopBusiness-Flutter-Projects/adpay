import 'package:adpay/features/login/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/get_size.dart';
import '../cubit/reset_pass_cubit.dart';

class NewPass extends StatefulWidget {
  NewPass({super.key});
  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  GlobalKey<FormState> loginKey2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPassCubit, ResetPassState>(
      listener: (context, state) {
        if (state is LoadingResetAuth) {
          EasyLoading.show(status: 'loading...');
        } else if (state is LoadedResetAuth) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Login Success');
        } else if (state is ErrorResetAuth) {
          EasyLoading.showError("state.toString()");
        } else if (state is ErrorResetAuth) {
          EasyLoading.dismiss();
          EasyLoading.showError("${state.toString()}");
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        var cubit = context.read<ResetPassCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'newpass'.tr(),
              style: TextStyle(
                  color: AppColors.grayColor, fontWeight: FontWeight.w700),
            ),
          ),
          body: Form(
            key: loginKey2,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: getSize(context) / 16),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getSize(context) / 22),
                  child: Image.asset(
                    ImageAssets.appIconImage,
                    width: getSize(context) / 2.5,
                    height: getSize(context) / 2.5,
                  ),
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
                CustomTextField(
                  isPass: true,
                  onPressed: () {
                    cubit.toggleConfirmPassword();
                  },
                  obscureText: cubit.isPassword,
                  controller: cubit.passwprdConfirmController,
                  title: 'ConfirmPass'.tr(),
                  hintTitle: 'enter_password'.tr(),
                  message: 'enter_password'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: getSize(context) / 12),
                GestureDetector(
                  onTap: () {
                    print("screen");
                    cubit.resetAuth(context);
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
                        'confirm'.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getSize(context) / 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
