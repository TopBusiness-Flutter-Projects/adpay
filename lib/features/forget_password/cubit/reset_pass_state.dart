part of 'reset_pass_cubit.dart';

@immutable
sealed class ResetPassState {}

final class ResetPassInitial extends ResetPassState {}

class LoadingResetAuth extends ResetPassState {}

class LoadedResetAuth extends ResetPassState {}

class ErrorResetAuth extends ResetPassState {}

class ChangePasswordState extends ResetPassState {}

class Change2PasswordState extends ResetPassState {}

class SendCodeLoading extends ResetPassState {}

class OnSmsCodeSent extends ResetPassState {
  String smsCode;
  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends ResetPassState {}

class CheckCodeSuccessfully extends ResetPassState {}

class CheckCodeErrorfully extends ResetPassState {}
