import 'dart:async';
import 'dart:io';

import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/models/product_details_model.dart';
import '../../../../core/models/shopcatogriesmodel.dart';
import '../../../../core/models/subcatogrey_model.dart';
import '../../../../core/utils/dialogs.dart';
import 'state.dart';

class AddNewProductCubit extends Cubit<AddNewProductState> {
  AddNewProductCubit(this.api) : super(AddAddNewProductInitState());

  ServiceApi api;

  TextEditingController discriptoionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController limitController = TextEditingController();

  GetShopCategoriesModel? maincatogreyModel;
  Category? currentMainCategories;

  SubCatogreyModel? subcategoriesModel;
  SubCategory? currentSubCategory;

  List<File> selectedImages = [];

  Future pickLogoImages() async {
    emit(LoadinglogoNewImage());
    try {
      final List<XFile> images = await ImagePicker().pickMultiImage(
        limit: 5,
      );
      if (images == null) return;
      selectedImages.clear();
      for (var image in images) {
        final imageTemporary = File(image.path);
        selectedImages.add(imageTemporary);
      }
      print('............${selectedImages.length} images selected');
      emit(LoadedlogoNewImage());
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

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

  onChangeMain(Category? category) {
    subcategoriesModel = null;

    currentMainCategories = category;
    subcatogrey(id: category?.id.toString());
    emit(ONChangeMainCategory());
  }

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

//
  String currentType = 'new'.tr();

  List<String> typeList = ['new'.tr(), 'used'.tr()];

  onChangeType(value) {
    currentType = value;

    emit(ONChangeType());
  }

  addNewProduct(BuildContext context) async {
    emit(LoadingAddNewProduct());
    final res = await api.addNewProduct(
        images: selectedImages,
        title: nameController.text,
        describtion: discriptoionController.text,
        price: priceController.text,
        type: currentType == 'new'.tr() ? 'new' : 'used',
        discount: discountController.text,
        shopCatId: currentMainCategories!.id.toString(),
        shopSubCat: currentSubCategory!.titleAr ?? '',
        stock: limitController.text);
    res.fold((l) {
      emit(ErrorAddNewProduct());
    }, (r) {
      successGetBar(r.msg);
      selectedImages.clear();
      updatedimages.clear();
      nameController.clear();
      discriptoionController.clear();
      discountController.clear();
      limitController.clear();
      priceController.clear();

      Navigator.pop(context);
      emit(LoadedAddNewProduct());
    });
  }

  List<String> updatedimages = [];
  onTapToUpdate(
      ProductDetailsModel? productsModelDetails, BuildContext context) {
    nameController.text = productsModelDetails!.data!.titleAr ?? '';
    discriptoionController.text =
        productsModelDetails.data!.descriptionAr ?? '';
    priceController.text = productsModelDetails.data!.price.toString();
    discountController.text = productsModelDetails.data!.discount.toString();
    limitController.text = productsModelDetails.data!.stock.toString();
    currentType =
        productsModelDetails.data!.type == 'new' ? 'new'.tr() : 'used'.tr();
    updatedimages = productsModelDetails.data!.images ?? [];
    currentMainCategories = Category(
        id: productsModelDetails.data!.vendor!.shopCat!.id!,
        titleAr: productsModelDetails.data!.vendor!.shopCat!.titleAr!,
        titleEn: productsModelDetails.data!.vendor!.shopCat!.titleEn!,
        status: productsModelDetails.data!.vendor!.shopCat!.status!);

    Navigator.pushNamed(context, Routes.addNewProductScreen, arguments: true);
    emit(ONUpdateProduct());
  }

  updateProduct(BuildContext context) async {
    emit(LoadingAddNewProduct());
    final res = await api.updateProduct(
        productId:
            context.read<MainVendorCubit>().productsModelDetails!.data!.id ?? 1,
        images: selectedImages,
        title: nameController.text,
        describtion: discriptoionController.text,
        price: priceController.text,
        type: currentType == 'new'.tr() ? 'new' : 'used',
        discount: discountController.text,
        shopCatId: currentMainCategories!.id.toString(),
        shopSubCat: currentSubCategory!.titleAr ?? '',
        stock: limitController.text);
    res.fold((l) {
      emit(ErrorAddNewProduct());
    }, (r) {
      successGetBar(r.msg);
      nameController.clear();
      discriptoionController.clear();
      discountController.clear();
      limitController.clear();
      priceController.clear();
      selectedImages.clear();
      updatedimages.clear();
      Navigator.pop(context);
      context.read<MainVendorCubit>().getTotalProductsVendor();
      Navigator.pop(context);
      emit(LoadedAddNewProduct());
    });
  }
}
