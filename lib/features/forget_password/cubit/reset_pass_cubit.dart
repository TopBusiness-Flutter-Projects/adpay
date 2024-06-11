import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/remote/service.dart';
import '../../../core/utils/dialogs.dart';
part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit(this.api) : super(ResetPassInitial());
  ServiceApi api;
  bool isConfirmPassword = true;
  int currentUser = 2; // 1 driver  2  user
//!  register
  bool isPassword = true;
  String? deviceToken;
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  //confirm
  toggleConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    emit(Change2PasswordState());
  }

  // var formKey = GlobalKey<FormState>();

  //! login

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();
  TextEditingController passwprdConfirmController = TextEditingController();
  Future<void> resetAuth(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingResetAuth());
    final response = await api.Reset(
      phone: phoneController.text,
      password: passwprdController.text,
      password_confirmation: passwprdConfirmController.text,
    );
    //
    response.fold((l) {
      emit(ErrorResetAuth());
    }, (r) async {
      emit(LoadedResetAuth());
      print("loaded");
      successGetBar(r.msg);
      if (r.status == 1) {
        Navigator.pushReplacementNamed(
          context,
          Routes.choosLogin,
        );
      } else {
        errorGetBar(r.msg);
      }
    });
  }

  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _mAuth = FirebaseAuth.instance;
  String? verificationId;
  String? smsCode;
  int? resendToken;
  sendOTP(BuildContext context) async {
    emit(SendCodeLoading());
    //
    await _mAuth
        .verifyPhoneNumber(
      phoneNumber: '+2' + phoneController.text,
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
      Navigator.pushNamed(context, Routes.oTPVerifyrResetScreen);
    });
  }

  verifyOtp(String smsCode, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode);
    //!  OTP validate true or false
    await _mAuth.signInWithCredential(credential).then((value) {
      emit(CheckCodeSuccessfully());
      //
      // successGetBar("message");
      Navigator.pushNamed(context, Routes.NewPass);
      //! loginAuth
    }).catchError((error) {
      errorGetBar(error.toString());

      emit(CheckCodeErrorfully());
    });
  }
}
