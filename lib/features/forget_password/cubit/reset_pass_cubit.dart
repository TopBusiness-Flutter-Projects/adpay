import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      pref.setBool('onBoarding', true);
    });
  }

}
