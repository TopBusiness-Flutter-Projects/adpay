abstract class SignUpUserState {}

class SignUpUserInitial extends SignUpUserState {}

class ChangeSignUpPageStates extends SignUpUserState {}

class ChangePasswordState extends SignUpUserState {}

class Change2PasswordState extends SignUpUserState {}

class LoadingAddNewImage extends SignUpUserState {}

class LoadedAddNewImage extends SignUpUserState {}

class LoadinglogoNewImage extends SignUpUserState {}

class LoadedlogoNewImage extends SignUpUserState {}

class ChangeToStoreInfo extends SignUpUserState {}

class ErrorSignUpAuth extends SignUpUserState {}

class LoadedSignUpAuth extends SignUpUserState {}

// class ChangePasswordState extends SignUpUserState {}

class LoadingSignUpAuth extends SignUpUserState {}

class SendCodeLoading extends SignUpUserState {}

class OnSmsCodeSent extends SignUpUserState {
  String smsCode;
  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends SignUpUserState {}

class CheckCodeSuccessfully extends SignUpUserState {}

class CheckCodeErrorfully extends SignUpUserState {}
