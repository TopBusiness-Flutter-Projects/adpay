import 'dart:io';
import 'package:adpay/core/remote/service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/add_harag_model.dart';
import '../../../../core/models/shopcatogriesmodel.dart';
import '../../../../core/models/subcatogrey_model.dart';
import '../../../../core/utils/dialogs.dart';
part 'add_harag_state.dart';

class AddHaragCubit extends Cubit<AddHaragState> {
  AddHaragCubit(this.api) : super(AddHaragInitial());
  ServiceApi api;

  TextEditingController discriptoionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  File? selectedImage;
  SubCatogreyModel? subCatogreyModel;

  GetShopCategoriesModel? maincatogreyModel;
  File? logoImage;
  File? bannerImage;
  SubCatogreyModel? subcategoriesModel;
  Future pickLogoImage({required String imageName}) async {
    emit(LoadinglogoNewImage());
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      if (imageName == 'user_image') {
        selectedImage = await imageTemporary;
        print('............${selectedImage?.path}');
      } else if (imageName == 'logoImage') {
        logoImage = await imageTemporary;
      } else if (imageName == 'bannerImage') {
        bannerImage = await imageTemporary;
      }
      emit(LoadedlogoNewImage());
    } on PlatformException catch (e) {
      print('error $e');
    }
  }
//mm

  Future<void> addharag(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoadingHarag());
    final response = await api.AddHarag(
      title_ar: nameController.text,
      profileImage: selectedImage ?? File('00'),
      description_ar: discriptoionController.text,
      user_id: currentMainCategories?.id.toString() ?? "",
      price: priceController.text,
      cat_id: currentSubCategory?.id.toString() ?? "",
      sub_cat_id: subcategoriesModel?.data[0].id.toString() ?? "",
    );
    response.fold((l) {
      emit(ErrorHarag());
    }, (r) async {
      print("loaded");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      successGetBar(r.msg);
      Navigator.pop(context);
      nameController.clear();
      discriptoionController.clear();
      priceController.clear();
      selectedImage = null;
      emit(LoadedHarag(addharagModel: r));
    });
  }

  //shop catogrey

  Future<void> getMainCatogrey(BuildContext context) async {
    emit(LoadingGetCatogreyModel());
    final response = await api.getshopcatogrey();
    response.fold((l) {
      emit(ErrorGetCatogreyModel());
    }, (r) async {
      maincatogreyModel = r;
      print("loaded");
      // currentMainCategories = r.data.first;
      emit(LoadedGetCatogreyModel(categoriesModel: r));
    });
  }

  Category? currentMainCategories;

  onChangeMain(Category? category) {
    subcategoriesModel = null;

    currentMainCategories = category;
    subcatogrey(id: category?.id.toString());
    emit(ONChangeMainCategory());
  }

  SubCategory? currentSubCategory;
  onchangeSubCategory(SubCategory? category) {
    currentSubCategory = category;
    emit(ONChangeSubMainCategory());
  }

  Future<void> subcatogrey({String? id}) async {
    emit(LoadingSubCatogreyModel());
    final response = await api.postSubCtogrey(id1: id);
    response.fold((l) {
      emit(ErrorGetCatogreyModel());
    }, (r) async {
      subcategoriesModel = r;
      print("loaded");
      emit(LoadedSubCatogreyModel(subcategoriesModel: r));
    });
  }
}
