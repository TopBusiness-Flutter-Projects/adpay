import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adpay/core/models/login_model.dart';
import 'package:adpay/core/preferences/preferences.dart';
import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/login/cubit/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/dialogs.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(InitLoginState());
  ServiceApi api;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();

  int currentUser = 2; // 1 driver  2  user

  // toggleDriver() {
  //   currentUser = 1;
  //   emit(DriverState());
  // }

  // toggleUser() {
  //   currentUser = 2;
  //   emit(UserState());
  // }

  bool isPassword = true;

  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  var formKey = GlobalKey<FormState>();
  LoginModel? userModel;
  loginAuth(BuildContext context, String type) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingLoginAuth());
    final response = await api.loginAuth(
        phone: phoneController.text,
        password: passwprdController.text,
        type: type);
    response.fold((l) {
      emit(ErrorLoginAuth());
    }, (r) {
      if (r.code == 200) {
        Preferences.instance.setUser(r).then((value) {
          userModel = r;
          (userModel!.data!.user!.type == 'user' &&
                  userModel!.data!.user!.userType != null)
              ? Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeRoute,
                  (route) => false,
                )
              : Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeRouteDriver,
                  (route) => false,
                );
          successGetBar(r.message);
        });
        phoneController.clear();
        passwprdController.clear();
        pref.setBool('onBoarding', true);
        emit(LoadedLoginAuth());
      } else {
        errorGetBar(r.message ?? "");
        emit(ErrorLoginAuth());
      }
    });
  }
}
