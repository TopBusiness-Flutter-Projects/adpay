import 'package:adpay/core/utils/call_method.dart';
import 'package:adpay/features/register_user/cubit/register_user_cubit.dart';
import 'package:adpay/features/vendor_sign_up/cubit/cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adpay/core/models/login_model.dart';
import 'package:adpay/core/preferences/preferences.dart';
import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/login/cubit/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/dialogs.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(InitLoginState());
  ServiceApi api;

  int currentUser = 2; // 1 driver  2  user
//!  register
  bool isPassword = true;
  String? deviceToken;
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  var formKey = GlobalKey<FormState>();
  LoginModel? userModel;

  //! login

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();
  Future<void> loginAuth(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    deviceToken = prefs.getString('checkUser');
    emit(LoadingLoginAuth());
    final response = await api.loginAuth(
        phone: phoneController.text,
        password: passwprdController.text);
    //
    response.fold((l) {
      emit(ErrorLoginAuth());
    }, (r) async {


      if (r.status == 1) {

        print("loaded");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('auth-token', r.data?.token.toString() ?? "");
        Preferences.instance.setUser(r).then((value) {
          userModel = r;
          phoneController.clear();
          passwprdController.clear();
;          (userModel?.data?.type == 'user' && userModel?.data?.type != null)
              ? Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.floatingRote,
                (route) => false,
          )
              : (userModel?.data?.type == 'vendor' &&
              userModel?.data?.type != null)
              ? Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.floatVendor,
                (route) => false,
          )
              : null;
          successGetBar(r.msg);
        });
        emit(LoadedLoginAuth());
        pref.setBool('onBoarding', true);

      }else{
        errorGetBar(r.msg ?? '');

        emit(ErrorLoginAuth());
      }


    });
  }

  // Future<void> loginAuthProvider(BuildContext context) async {
  //   var pref = await SharedPreferences.getInstance();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   deviceToken = prefs.getString('checkUser');
  //   emit(LoadingLoginAuth());
  //   final response = await api.loginAuthProvider(
  //       phone: phoneController.text,
  //       password: passwprdController.text,
  //       device_token: '$deviceToken');
  //   //
  //   response.fold((l) {
  //     emit(ErrorLoginAuth());
  //   }, (r) async {
  //     print("loaded");
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('auth-token', r.data?.token.toString() ?? "");
  //     Preferences.instance.setUser(r).then((value) {
  //       userModel = r;
  //       (userModel?.data?.type == 'user' && userModel?.data?.type != null)
  //           ? Navigator.pushNamedAndRemoveUntil(
  //               context,
  //               Routes.homeRoute,
  //               (route) => false,
  //             )
  //           : (userModel?.data?.type == 'vendor' &&
  //                   userModel?.data?.type != null)
  //               ? Navigator.pushNamedAndRemoveUntil(
  //                   context,
  //                   Routes.floatVendor,
  //                   (route) => false,
  //                 )
  //               : null;
  //       successGetBar(r.msg);
  //     });
  //     emit(LoadedLoginAuth());

  //     pref.setBool('onBoarding', true);
  //   });
  // }

  Future<void> CheckUser(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingCheckUserAuth());
    final response = await api.CheckUser(
      phone: phoneController.text,
    );
    //
    response.fold((l) {
      emit(ErrorCheckUserAuth());
    }, (r) async {
      if (r.status == 1) {
        print("loaded");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('checkUser', r.data!.deviceToken.toString());
        await prefs.setString('name', r.data!.name.toString());
        loginAuth(context);
        pref.setBool('onBoarding', true);
        emit(LoadedCheckUserAuth());
      } else if (r.status == 0) {
        errorGetBar(r.msg ?? '');

        Navigator.pop(context);
        emit(ErrorCheckUserAuth());
      } else {
        errorGetBar(r.msg ?? '');
      }
    });
  }

  //! OTP
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _mAuth = FirebaseAuth.instance;
  String? verificationId;
  String? smsCode;
  int? resendToken;

  String countryCode = '';
bool  isRegisterUser =true;
  sendOTP(BuildContext context ,{required String phonee ,bool isUser =true}) async {
    isRegisterUser =isUser;
    emit(SendCodeLoading());
    //
    await _mAuth
        .verifyPhoneNumber(
      phoneNumber: countryCode + "${phonee}" ,
      verificationCompleted: (PhoneAuthCredential credential) {
        print('=========================================');
        print("verificationId=>$verificationId");
        print('smsCode : $smsCode');
        print('=========================================');
        smsCode = credential.smsCode;
        verificationId = credential.verificationId;

        //! check verify

        emit(OnSmsCodeSent(smsCode ?? ''));
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(CheckCodeInvalidCode());
        print("Errrrorrrrr : ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        this.resendToken = resendToken;
        this.verificationId = verificationId;
        print("verificationId=>$verificationId");
        emit(OnSmsCodeSent(''));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
        print('*************************************');
        print("verificationId=>$verificationId");
        print('smsCode : $smsCode');
        print('*************************************');
      },
    )
        .then((value) {
      Navigator.pushNamed(context, Routes.otpScreen);
    });
  }

  verifyOtp(String smsCode, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode);
    //!  OTP validate true or false
    await _mAuth.signInWithCredential(credential).then((value) {
      emit(CheckCodeSuccessfully());
      //
      //! loginAuth
    //  CheckUser(context);
      if(isRegisterUser)
      context.read<SignUpUserCubit>().postRegister(context);
      else
        context.read<SignUpVendorCubit>().vendorRegister(context);
    }).catchError((error) {
      errorGetBar(error.toString());

      emit(CheckCodeErrorfully());
    });
  }
}
