import 'dart:io';

import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/vendor_sign_up/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/models/shop_category_vendor_model.dart';
import '../../../core/models/shopcatogriesmodel.dart';
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
  vendorRegister() async {
    emit(LoadingRgisterVendorState());
    final res = await api.vendorRegister(
      banner: bannerImage ?? File(''),
      logo: logoImage ?? File(''),
      profileImage: logoImage ?? File(''),
      name: nameController.text,
      password: passwprdController.text,
      phone: phoneController.text,
      shopCatId: selectedCategoryValue?.id ?? 1,
      subCategory: subCategoryList,
      titleAr: "",
      type: selectedOption == 1 ? 'vendor' : 'advertise',
    );
    res.fold((l) {
      emit(ErrorRgisterVendorState());
    }, (r) {
      successGetBar(r.msg);

      emit(LoadedRgisterVendorState());
    });
  }
  //!
}
