abstract class LoginState {}

class InitLoginState extends LoginState {}

class ChangePasswordState extends LoginState {}

class UserState extends LoginState {}

class DriverState extends LoginState {}

class LoadingLoginAuth extends LoginState {}

class LoadedLoginAuth extends LoginState {}

class ErrorLoginAuth extends LoginState {}
