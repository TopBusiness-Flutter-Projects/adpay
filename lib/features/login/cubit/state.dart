abstract class LoginState {}

class InitLoginState extends LoginState {}

class ChangePasswordState extends LoginState {}

class UserState extends LoginState {}

class DriverState extends LoginState {}

class LoadingLoginAuth extends LoginState {}

class LoadedLoginAuth extends LoginState {}

class ErrorLoginAuth extends LoginState {}

class LoadingCheckUserAuth extends LoginState {}

class LoadedCheckUserAuth extends LoginState {}

class ErrorCheckUserAuth extends LoginState {}

class SendCodeLoading extends LoginState {}

class OnSmsCodeSent extends LoginState {
  String smsCode;
  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends LoginState {}

class CheckCodeSuccessfully extends LoginState {}

class CheckCodeErrorfully extends LoginState {}
