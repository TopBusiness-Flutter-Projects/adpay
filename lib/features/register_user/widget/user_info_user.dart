import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/features/login/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/utils/assets_manager.dart';
import '../../login/widgets/custom_text_field.dart';
import '../cubit/register_user_cubit.dart';

class UserInfoWidgetUser extends StatefulWidget {
  UserInfoWidgetUser({required this.cubit, super.key});
  SignUpUserCubit cubit;
  // LoginCubit loginCubit;

  @override
  State<UserInfoWidgetUser> createState() => _UserInfoWidgetUserState();
}

class _UserInfoWidgetUserState extends State<UserInfoWidgetUser> {
  GlobalKey<FormState> registerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit =  context.read<LoginCubit>();
    return Scaffold(
        body: Form(
      key: registerKey,
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          SizedBox(height: getSize(context) / 32),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                widget.cubit.selectedImage == null
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: getSize(context) / 8,
                        backgroundImage: AssetImage(ImageAssets.logoImage),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: getSize(context) / 8,
                        backgroundImage: FileImage(widget.cubit.selectedImage!),
                      ),
                InkWell(
                    onTap: () {
                      widget.cubit.pickLogoImage(imageName: "user_image");
                    },
                    child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(getSize(context) / 88),
                            color: Colors.white),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.primary,
                        )))
              ],
            ),
          ),
          SizedBox(height: getSize(context) / 32),
          CustomTextField(
            controller: widget.cubit.nameController,
            title: 'name'.tr(),
            hintTitle: 'enter_name'.tr(),
            message: 'enter_name'.tr(),
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: getSize(context) / 32),
          CustomTextField(
            isPhoneNumber: true,
            onPhoneChanged: (code, number) {
              setState(() {
               loginCubit.countryCode = code;
              });
            },
            controller: widget.cubit.phoneController,
            message: 'enter_phone'.tr(),
            title: 'phone'.tr(),
            hintTitle: 'enter_phone'.tr(),
            keyboardType: TextInputType.phone,

          ),
          // CustomTextField(
          //   controller: widget.cubit.phoneController,
          //   title: 'phone'.tr(),
          //   hintTitle: 'enter_phone'.tr(),
          //   message: 'enter_phone'.tr(),
          //   keyboardType: TextInputType.phone,
          // ),
          SizedBox(height: getSize(context) / 32),
          CustomTextField(
            isPass: true,
            onPressed: () {
              widget.cubit.togglePassword();
            },
            obscureText: widget.cubit.isPassword,
            controller: widget.cubit.passwprdController,
            title: 'password'.tr(),
            hintTitle: 'enter_password'.tr(),
            message: 'enter_password'.tr(),
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: getSize(context) / 32),
          CustomTextField(
            isPass: true,
            onPressed: () {
              widget.cubit.toggleConfirmPassword();
            },
            obscureText: widget.cubit.isConfirmPassword,
            controller: widget.cubit.confirmPasswprdController,
            title: 'confirm_password'.tr(),
            hintTitle: 'enter_password'.tr(),
            message: 'enter_password'.tr(),
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: getSize(context) / 32),
          InkWell(
            onTap: () {
              //3
              if (registerKey.currentState!.validate()) {
                print("screen");
                if (widget.cubit.passwprdController.text ==
                    widget.cubit.confirmPasswprdController.text) {
                  if (widget.cubit.selectedImage != null) {
                    loginCubit.sendOTP(context,phonee:widget.cubit.phoneController.text);
                    //widget.cubit.postRegister(context);
                  } else {
                    Fluttertoast.showToast(msg: 'please enter image');
                    //show messae
                    //!stop loading
                  }
                } else {
                  Fluttertoast.showToast(msg: 'please enter same pass');
                }
              }
            },
            child: Container(
              margin: EdgeInsets.all(getSize(context) / 22),
              alignment: Alignment.center,
              width: double.infinity,
              height: getSize(context) / 8,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(
                  getSize(context) / 22,
                ),
              ),
              child: Text(
                'createaccount'.tr(),
                style: TextStyle(
                  fontSize: getSize(context) / 18,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
