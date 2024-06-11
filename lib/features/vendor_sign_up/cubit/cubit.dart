import 'dart:io';

import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/vendor_sign_up/cubit/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/models/login_model.dart';
import '../../../core/models/shop_category_vendor_model.dart';
import '../../../core/models/shopcatogriesmodel.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/dialogs.dart';

class SignUpVendorCubit extends Cubit<SignUpVendorState> {
  SignUpVendorCubit(this.api) : super(SignUpVendorInitial());
  ServiceApi api;

  bool isPersonalType = true;
  nextButton() {
    isPersonalType = false;
    emit(ChangeToStoreInfo());
  }

  void setSignUpPageType(bool isMarket) {
    isPersonalType = isMarket;
    emit(ChangeSignUpPageStates());
  }

  bool isPassword = true;
  bool isConfirmPassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();
  TextEditingController confirmPasswprdController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController adressNameController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  toggleConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    emit(Change2PasswordState());
  }

  File? selectedImage;

  File? logoImage;
  File? bannerImage;

  Future pickLogoImage({required String imageName}) async {
    emit(LoadinglogoNewImage());
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      if (imageName == 'user_image') {
        selectedImage = imageTemporary;
      } else if (imageName == 'logoImage') {
        logoImage = imageTemporary;
      } else if (imageName == 'bannerImage') {
        bannerImage = imageTemporary;
      }
      emit(LoadedlogoNewImage());
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

  int? selectedOption = 1; //

  //TODO after add male selectedImage null

  String? selectedValue;
  List<String> subCategoryList = [];

  addNewSubCategory(BuildContext context) {
    emit(LoadingAddNewSubCategory());
    subCategoryList.add(subCategoryController.text);
    Navigator.pop(context);
    emit(LoadedAddNewSubCategory());
    subCategoryController.clear();
  }

  getVendorGetShopCategories() async {
    emit(LoadingGetShopCategoryVendorState());
    final res = await api.getVendorGetShopCategories();
    res.fold((l) {
      emit(ErrorGetShopCategoryVendorState());
    }, (r) {
      shopCategoryVendorModel = r;
      selectedCategoryValue = r.data.first;

      emit(LoadedGetShopCategoryVendorState());
    });
  }

  GetShopCategoriesModel? shopCategoryVendorModel;
  Category? selectedCategoryValue;
  //! sign up vendor

  //!
  LoginModel? userModel;
  vendorRegister(BuildContext context) async {
    emit(LoadingRgisterVendorState());
    final res = await api.vendorRegister(
      banner: bannerImage,
      logo: logoImage,
      profileImage: selectedImage ?? File(''),
      name: nameController.text,
      password: passwprdController.text,
      phone: phoneController.text,
      shopCatId: selectedCategoryValue?.id ?? 1,
      subCategory: subCategoryList,
      storeName: storeNameController.text,
      address: adressNameController.text,
      type: selectedOption == 1 ? 'vendor' : 'advertise',
    );
    res.fold((l) {
      emit(ErrorRgisterVendorState());
    }, (r) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth-token', r.data?.token.toString() ?? "");
      Preferences.instance.setUser(r).then((value) {
        userModel = r;
        (userModel?.data?.type == 'user' && userModel?.data?.type != null)
            ? Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.floatingRote,
                (route) => false,
              )
            : ((userModel?.data?.type == 'vendor' ||
                        userModel?.data?.type == 'advertise') &&
                    userModel?.data?.type != null)
                ? Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.floatVendor,
                    (route) => false,
                  )
                : null;
        successGetBar(r.msg);
      });
      prefs.setBool('onBoarding', true);

      emit(LoadedRgisterVendorState());
    });
  }

  //!
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
      Navigator.pushNamed(context, Routes.oTPVerifyRegisterScreen);
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
      vendorRegister(context);
    }).catchError((error) {
      errorGetBar(error.toString());

      emit(CheckCodeErrorfully());
    });
  }
}
