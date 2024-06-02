import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../cubit/edit_profile_cubit.dart';
import '../widget/user_info_user.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is LoadingEdit) {
          EasyLoading.show(status: 'loading...');
        }   else if (state is LoadedEdit) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Edited Success');
        } else if (state is ErrorEdit) {
          EasyLoading.showError("state.toString()");
        }
      },
      builder: (context, state) {
        var cubit = context.read<EditProfileCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              "editprofile".tr(),
              style: TextStyle(color: AppColors.grayColor),
            ),
          ),
          body: Column(
            children: [
              Flexible(
                child: UserInfoWidgetUser2(cubit: cubit)
              )
            ],
          ),
        );
      },
    );
  }
}
