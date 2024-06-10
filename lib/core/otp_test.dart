// import 'package:adpay/core/remote/service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../config/routes/app_routes.dart';
// import '../../../core/utils/dialogs.dart';
// import '../features/login/cubit/state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit(this.api) : super(InitLoginState());
//   ServiceApi api;
//
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passwprdController = TextEditingController();
//
//   int currentUser = 2; // 1 driver  2  user
//
//   // toggleDriver() {
//   //   currentUser = 1;
//   //   emit(DriverState());
//   // }
//
//   // toggleUser() {
//   //   currentUser = 2;
//   //   emit(UserState());
//   // }
//
//   bool isPassword = true;
//
//   togglePassword() {
//     isPassword = !isPassword;
//     emit(ChangePasswordState());
//   }
//
//   var formKey = GlobalKey<FormState>();
//   LoginModel? userModel;
//   CountryCodeModel phoneCode =
//   CountryCodeModel(code: '+20', name: 'مصر', image: 'assets/images/eg.png');
//   loginAuth(BuildContext context) async {
//     var pref = await SharedPreferences.getInstance();
//     emit(LoadingLoginAuth());
//     final response = await api.loginAuth(
//         phone: phoneController.text, phoneCode: phoneCode.code!);
//     response.fold((l) {
//       emit(ErrorLoginAuth());
//     }, (r) {
//       print(r.status);
//       if (r.status == 200) {
//         Preferences.instance.setUser(r).then((value) {
//           userModel = r;
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             Routes.mainRoute,
//                 (route) => false,
//           );
//           successGetBar(r.msg ?? '');
//         });
//         phoneController.clear();
//         passwprdController.clear();
//         phoneCode = CountryCodeModel(
//             code: '+20', name: 'مصر', image: 'assets/images/eg.png');
//         emit(LoadedLoginAuth());
//       } else if (r.status == 400) {
//         Navigator.pushNamedAndRemoveUntil(
//             context, Routes.createProfileRoute, (route) => false,
//             arguments: {
//               "phone": phoneController.text,
//               "phoneCode": phoneCode.code!,
//             });
//
//         //! nav to create account
//       } else {
//         errorGetBar("${r.msg ?? ""} ${r.status}");
//         emit(ErrorLoginAuth());
//       }
//     });
//   }
//
//   TextEditingController otpController = TextEditingController();
//   final FirebaseAuth _mAuth = FirebaseAuth.instance;
//   String? verificationId;
//   String? smsCode;
//   int? resendToken;
//   sendOTP(BuildContext context) async {
//     emit(SendCodeLoading());
//     await _mAuth
//         .verifyPhoneNumber(
//       phoneNumber: phoneCode.code! + phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) {
//         print('=========================================');
//         print("verificationId=>$verificationId");
//         print('smsCode : $smsCode');
//         print('=========================================');
//         smsCode = credential.smsCode;
//         verificationId = credential.verificationId;
//         //!
//
//         emit(OnSmsCodeSent(smsCode ?? ''));
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         emit(CheckCodeInvalidCode());
//         print("Errrrorrrrr : ${e.message}");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         this.resendToken = resendToken;
//         this.verificationId = verificationId;
//         print("verificationId=>$verificationId");
//         emit(OnSmsCodeSent(''));
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         this.verificationId = verificationId;
//         print('*************');
//         print("verificationId=>$verificationId");
//         print('smsCode : $smsCode');
//         print('*************');
//       },
//     )
//         .then((value) {
//       Navigator.pushNamed(context, Routes.otpScreen);
//     });
//   }
//
//   verifyOtp(String smsCode, BuildContext context) async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId!, smsCode: smsCode);
//     //!  OTP validate true or false
//     await _mAuth.signInWithCredential(credential).then((value) {
//       emit(CheckCodeSuccessfully());
//       //
//       //! loginAuth
//       loginAuth(context);
//     }).catchError((error) {
//       errorGetBar(error.toString());
//       emit(CheckCodeErrorfully());
//     });
//   }
//
// ///!  OTP validate true or false nav to Auth login
// }