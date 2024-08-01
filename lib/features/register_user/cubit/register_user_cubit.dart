import 'dart:io';
import 'package:adpay/core/models/login_model.dart';
import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/register_user/cubit/register_user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/models/shop_category_vendor_model.dart';
import '../../../core/preferences/preferences.dart';

class SignUpUserCubit extends Cubit<SignUpUserState> {
  SignUpUserCubit(this.api) : super(SignUpUserInitial());
  ServiceApi api;

  bool isPersonalType = true;
  nextButton() {
    isPersonalType = false;
    emit(ChangeToStoreInfo());
  }
  String countryCode = '';
  void setSignUpPageType(bool isMarket) {
    isPersonalType = isMarket;
    emit(ChangeSignUpPageStates());
  }

  bool isPassword = true;
  bool isConfirmPassword = true;
  LoginModel? userModel;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();
  TextEditingController confirmPasswprdController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController adressNameController = TextEditingController();
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

  int? selectedOption = 1;
  //post register
  Future<void> postRegister(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingSignUpAuth());
    final response = await api.userRegister(
      password: passwprdController.text,
      profileImage: selectedImage!,
      phone: phoneController.text,
      name: nameController.text,
    );
    print(phoneController.text);
    print(passwprdController.text);
    print(nameController.text);
    response.fold((l) {
      print("errror register");
      emit(ErrorSignUpAuth());
    }, (r) async {
      print("right register");
      if (r.status == 0) {
        print("right status 0");
        Fluttertoast.showToast(msg: r.msg ?? '');
        Navigator.pop(context);
        EasyLoading.dismiss();

      } else {
        print("right status 1");
        userModel = r;
        Preferences.instance.setUser(r).then((value) {
          print("loaded");
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.float,
            (route) => false,
          );
          pref.setBool('onBoarding', true);
          emit(LoadedSignUpAuth());
        });
      }
    });
  }


}
