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
  String? Devicetoken;
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  var formKey = GlobalKey<FormState>();
  LoginModel? userModel;
  // void loginValidate() {
  //   if (formKey.currentState!.validate()) {
  //     loginAuth(context);
  //   }
  // }
  Future<void>loginAuth(BuildContext context) async {

    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Devicetoken  = prefs.getString('checkUser' ?? "");
      emit(LoadingLoginAuth());
      final response = await api.loginAuth(
          phone: phoneController.text,
          password: passwprdController.text,
          device_token: '$Devicetoken');
      //
      response.fold((l) {
        emit(ErrorLoginAuth());
      }, (r) async {
          print("loaded");
          emit(LoadedLoginAuth());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('auth-token', r.data?.token.toString() ?? "");
          Preferences.instance.setUser(r).then((value) {
            userModel = r;
            (userModel?.data?.type == 'user' &&
                userModel?.data?.type!= null)
                ? Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
                  (route) => false,
            )
                : (userModel?.data?.type == 'driver' &&
                userModel?.data?.type!= null)? Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRouteDriver,
                  (route) => false,
            ):null;
            successGetBar(r.msg);
          });
        //  phoneController.clear();
        //  passwprdController.clear();
          pref.setBool('onBoarding', true);
        // } else {
        //   errorGetBar(r.message ?? "");
        //   emit(ErrorLoginAuth());
        // }
      });

    }
  Future<void>CheckUser(BuildContext context) async {

    var pref = await SharedPreferences.getInstance();
    emit(LoadingLoginAuth());
    final response = await api.CheckUser(
        phone: phoneController.text,
      );
    //
    response.fold((l) {
      emit(ErrorLoginAuth());
    }, (r) async {

      print("loaded");
      emit(LoadedLoginAuth());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('checkUser', r.data!.deviceToken.toString() ?? "");
      prefs.setString('name', r.data!.name.toString() ?? "");

      loginAuth(context);
      pref.setBool('onBoarding', true);
    });
  }



}

