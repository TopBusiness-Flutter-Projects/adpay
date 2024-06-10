import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../cubit/register_user_cubit.dart';
import '../cubit/register_user_state.dart';
import '../widget/user_info_user.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});
  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpUserCubit, SignUpUserState>(
      listener: (context, state) {
        if (state is LoadingSignUpAuth) {
          EasyLoading.show(status: 'loading...');
        } else if (state is LoadedSignUpAuth) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess('Register Success');
        } else if (state is ErrorSignUpAuth) {
          EasyLoading.showError("state.toString()");
        }
      },
      builder: (context, state) {
        var cubit = context.read<SignUpUserCubit>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'signup'.tr(),
              style: TextStyle(color: AppColors.grayColor),
            ),
          ),
          body: Column(
            children: [Flexible(child: UserInfoWidgetUser(cubit: cubit))],
          ),
        );
      },
    );
  }
}
