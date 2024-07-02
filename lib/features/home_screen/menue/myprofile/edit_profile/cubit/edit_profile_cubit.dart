import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/models/login_model.dart';
import '../../../../../../core/preferences/preferences.dart';
import '../../../../../../core/remote/service.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.api) : super(EditProfileInitial());
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
  final List<String> genderItems = ['Male', 'Female'];
  String? selectedValue;
  //post register
  Future<void> PostRegister(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingEdit());
    final response = await api.userRegister(
      phone: phoneController.text,
      profileImage: selectedImage!,
      phoneCode: phoneController.text,
      name: nameController.text,
    );
    //
    response.fold((l) {
      emit(ErrorEdit());
    }, (r) async {
      userModel = r;
      Preferences.instance.setUser(r).then((value) {
        print("loaded");
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.float,
          (route) => false,
        );
        pref.setBool('onBoarding', true);

        emit(LoadedEdit());
      });
    });
  }
}
