abstract class SignUpVendorState {}

class SignUpVendorInitial extends SignUpVendorState {}

class ChangeSignUpPageStates extends SignUpVendorState {}

class ChangePasswordState extends SignUpVendorState {}

class Change2PasswordState extends SignUpVendorState {}

class LoadingAddNewImage extends SignUpVendorState {}

class LoadedAddNewImage extends SignUpVendorState {}

class LoadinglogoNewImage extends SignUpVendorState {}

class LoadedlogoNewImage extends SignUpVendorState {}

class ChangeToStoreInfo extends SignUpVendorState {}

class LoadingAddNewSubCategory extends SignUpVendorState {}

class LoadedAddNewSubCategory extends SignUpVendorState {}

class ErrorGetShopCategoryVendorState extends SignUpVendorState {}

class LoadedGetShopCategoryVendorState extends SignUpVendorState {}

class LoadingGetShopCategoryVendorState extends SignUpVendorState {}

class LoadingRgisterVendorState extends SignUpVendorState {}

class LoadedRgisterVendorState extends SignUpVendorState {}

class ErrorRgisterVendorState extends SignUpVendorState {}

class SendCodeLoading extends SignUpVendorState {}

class OnSmsCodeSent extends SignUpVendorState {
  String smsCode;
  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends SignUpVendorState {}

class CheckCodeSuccessfully extends SignUpVendorState {}
class CheckCodeErrorfully extends SignUpVendorState {}
//editprofile
class LoadingEditProfileState extends SignUpVendorState {}
class LoadedEditProfileState extends SignUpVendorState {}
class ErrorEditState extends SignUpVendorState {}


