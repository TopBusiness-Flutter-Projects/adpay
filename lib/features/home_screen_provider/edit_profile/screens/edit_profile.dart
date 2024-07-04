import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../login/widgets/custom_text_field.dart';
import '../../../vendor_sign_up/cubit/cubit.dart';
import '../../../vendor_sign_up/cubit/state.dart';

class EditProfileVendor extends StatefulWidget {
  EditProfileVendor({ super.key});
  @override
  State<EditProfileVendor> createState() => _EditProfileVendorState();
}
class _EditProfileVendorState extends State<EditProfileVendor> {
  void initState() {
    super.initState();
    context.read<SignUpVendorCubit>().getVendorDetails();
  }

  GlobalKey<FormState> registerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpVendorCubit, SignUpVendorState>(
        listener: (context, state) {
          if (state is LoadingEditProfileState ) {
            EasyLoading.show(status: 'loading...');
          } else if (state is LoadedEditProfileState) {
            EasyLoading.dismiss();
            EasyLoading.showSuccess('Edit Success');
          } else if (state is ErrorEditState) {
            EasyLoading.showError("state.toString()");
          } else if (state is ErrorEditState) {
            EasyLoading.dismiss();
            EasyLoading.showError("${state.toString()}");
          } else {
            EasyLoading.dismiss();
          }
        },
    builder: (context, state) {
    var cubit = context.read<SignUpVendorCubit>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'editprofile'.tr(),
            style: TextStyle(color: AppColors.grayColor),
          ),
        ),
        body: Form(
          key: registerKey,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              SizedBox(height: getSize(context) / 32),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    context.read<SignUpVendorCubit>().selectedImage == null
                        ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: getSize(context) / 8,
                      backgroundImage: NetworkImage(cubit.getVendorModel?.data?.image.toString()??""),
                    )
                        : CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: getSize(context) / 8,
                      backgroundImage: FileImage(context.read<SignUpVendorCubit>().selectedImage!),
                    ),
                    InkWell(
                        onTap: () {
                          context.read<SignUpVendorCubit>().pickLogoImage(imageName: "user_image");
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
              Container(
                child: Text('store_logo'.tr(),
                    style: TextStyle(
                        color: AppColors.grayColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getSize(context) / 20)),
              ),
              SizedBox(height: getSize(context) / 44),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getSize(context) / 4.5),
                child: GestureDetector(
                  onTap: () {
                    context.read<SignUpVendorCubit>().pickLogoImage(imageName: "logoImage");
                  },
                  child: Container(
                    height: getSize(context) / 4,
                    width: getSize(context),
                    decoration: BoxDecoration(
                        border: DashedBorder.fromBorderSide(
                            dashLength: 8,
                            side: BorderSide(color: Colors.grey, width: 2)),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: context.read<SignUpVendorCubit>().logoImage == null
                        ? Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Image.network(cubit.getVendorModel?.data?.logo??"",                        fit: BoxFit.cover,
                        )),
                        Text('Upload image',
                            style: TextStyle(
                                fontSize: getSize(context) / 30))
                      ],
                    )
                        : ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      child: Image.file(
                        context.read<SignUpVendorCubit>().logoImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getSize(context) / 44),
              Container(
                child: Text('banner_logo'.tr(),
                    style: TextStyle(
                        color: AppColors.grayColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getSize(context) / 20)),
              ),
              SizedBox(height: getSize(context) / 44),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: getSize(context) / 22),
                child: GestureDetector(
                  onTap: () {
                    context.read<SignUpVendorCubit>().pickLogoImage(imageName: "bannerImage");
                  },
                  child: Container(
                    height: getSize(context) / 4,
                    width: getSize(context),
                    decoration: BoxDecoration(
                        border: DashedBorder.fromBorderSide(
                            dashLength: 8,
                            side: BorderSide(color: Colors.grey, width: 2)),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child:
                    context.read<SignUpVendorCubit>().bannerImage == null
                        ? Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(cubit.getVendorModel?.data?.banner??"",
                              fit: BoxFit.cover,
                              // width:30
                                ),
                          ),
                        ),
                        Text('Upload image',
                            style: TextStyle(
                                fontSize: getSize(context) / 30))
                      ],
                    )
                        : ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10)),
                      child: Image.file(
                        context.read<SignUpVendorCubit>().bannerImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getSize(context) / 32),
              SizedBox(height: getSize(context) / 32),
              CustomTextField(
                controller: context.read<SignUpVendorCubit>().storeNameController,
                title: 'store_name'.tr(),
                hintTitle: cubit.getVendorModel?.data?.name??"",
                message: 'enter_store_name'.tr(),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: getSize(context) / 32),
              CustomTextField(
                controller: context.read<SignUpVendorCubit>().adressNameController,
                title: 'store_adress'.tr(),
                hintTitle: cubit.getVendorModel?.data?.address??"",
                message: 'enter_store_adress'.tr(),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: getSize(context) / 32),
              CustomTextField(
                isPass: true,
                onPressed: () {
                  context.read<SignUpVendorCubit>().togglePassword();
                },
                obscureText:context.read<SignUpVendorCubit>().isPassword,
                controller: context.read<SignUpVendorCubit>().passwprdController,
                title: 'password'.tr(),
                hintTitle: 'enter_password'.tr(),
                message: 'enter_password'.tr(),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: getSize(context) / 32),
              CustomTextField(
                isPass: true,
                onPressed: () {
                  context.read<SignUpVendorCubit>().toggleConfirmPassword();
                },
                obscureText: context.read<SignUpVendorCubit>().isConfirmPassword,
                controller: context.read<SignUpVendorCubit>().confirmPasswprdController,
                title: 'confirm_password'.tr(),
                hintTitle: 'enter_password'.tr(),
                message: 'enter_password'.tr(),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: getSize(context) / 32),
              InkWell(
                onTap: () {
                  cubit.editProfleVendor(context);
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
                    context.read<SignUpVendorCubit>().selectedOption == 1
                        ? 'next'.tr()
                        : 'signup'.tr(),
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
    );}}
