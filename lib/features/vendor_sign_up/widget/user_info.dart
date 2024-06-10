import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/assets_manager.dart';
import '../../login/widgets/custom_text_field.dart';
import '../cubit/cubit.dart';

class UserInfoWidget extends StatefulWidget {
  UserInfoWidget({required this.cubit, this.isUser = false, super.key});
  SignUpVendorCubit cubit;
  bool isUser;
  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
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
        SizedBox(
          height: getSize(context) / 4,
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                  title: Text(
                    'store_ads'.tr(),
                    style: TextStyle(
                      fontSize: getSize(context) / 28,
                    ),
                  ),
                  leading: Radio<int>(
                    value: 1,
                    activeColor: AppColors.primary,
                    groupValue: widget.cubit.selectedOption,
                    onChanged: (value) {
                      setState(() {
                        widget.cubit.selectedOption = value;
                        print("Button value: $value");
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: getSize(context) / 2.5,
                child: ListTile(
                  title: Text(
                    'ads'.tr(),
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: getSize(context) / 28,
                    ),
                  ),
                  leading: Radio<int>(
                    value: 2,
                    activeColor: AppColors.primary,
                    groupValue: widget.cubit.selectedOption,
                    onChanged: (value) {
                      setState(() {
                        widget.cubit.selectedOption = value;
                        print("Button value: $value");
                      });
                    },
                  ),
                ),
              ),
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
          controller: widget.cubit.phoneController,
          title: 'phone'.tr(),
          hintTitle: 'enter_phone'.tr(),
          message: 'enter_phone'.tr(),
          keyboardType: TextInputType.phone,
        ),
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
            setState(() {
              if (widget.cubit.selectedOption == 1) {
                widget.cubit.nextButton();
              } else {
                //TODO   SignUp
                //!
              }
            });
            //TODO
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
              widget.cubit.selectedOption == 1 ? 'next'.tr() : 'signup'.tr(),
              style: TextStyle(
                fontSize: getSize(context) / 18,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
