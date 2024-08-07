import 'dart:io';

import 'package:adpay/core/remote/service.dart';
import 'package:adpay/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/models/add_new_product.dart';
import '../../../../core/models/ads_packages_model.dart';
import 'state.dart';

class AddNewAdsCubit extends Cubit<AddNewAdsState> {
  AddNewAdsCubit(this.api) : super(AddNewAdsInitState());

  ServiceApi api;

  GetAdPackagesModel? adPackagesModel;
  GetAdPackagesModelData? currentPackage;
  GetAdPackagesModelData? currentPackage2;

  onChangePackage(package) {
    currentPackage = package;
    emit(OnChangeAdPackages());
  }

  getAdPackagesModel() async {
    emit(LoadingGetAdPackages());

    final res = await api.getAdPackagesModel();

    res.fold((l) {
      emit(ErrorGetAdPackages());
    }, (r) {
      adPackagesModel = r;
      emit(LoadedGetAdPackages());
    });
  }

  TextEditingController discriptoionController = TextEditingController();
  TextEditingController discriptoionController2 = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();

  TextEditingController videoLinkController = TextEditingController();
  TextEditingController videoLinkController2 = TextEditingController();

  File? selectedImage;
  AddNewProductModel ? addadsmodel;
  Future pickLogoImage() async {
    emit(LoadinglogoNewImage());
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      selectedImage = await imageTemporary;
      print('............${selectedImage?.path}');
      emit(LoadedlogoNewImage());
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

  addNewAd(BuildContext context) async {
    emit(LoadingAddNewAd());
    final res = await api.addNewAds(
      countViews: currentPackage?.count.toString() ?? '0',
      image: selectedImage!,
      packageId: currentPackage?.id.toString() ?? '0',
      title: nameController.text,
      describtion: discriptoionController.text,
      video: videoLinkController.text,
    );

    res.fold((l) {
      emit(ErrorAddNewAd());
    }, (r) {
      Navigator.pop(context);
      selectedImage = null;
      nameController.clear();
      discriptoionController.clear();
      videoLinkController.clear();
      successGetBar(r.msg);
      emit(LoadedAddNewAd());
    });
  }
  //editads
  editAds(BuildContext context, {String? id}) async {
    emit(LoadingAddNewAd());
    final res = await api.editads(
      countViews: currentPackage2?.count.toString() ?? '0',
      image: selectedImage!,
      packageId:id??"85",
      title: nameController2.text,
      describtion: discriptoionController2.text,
      video: videoLinkController2.text,
    );
    res.fold((l) {
      emit(ErrorAddNewAd());
    }, (r) {
      // addadsmodel=r;
      Navigator.pop(context);
      selectedImage = null;
      nameController2.clear();
      discriptoionController2.clear();
      videoLinkController2.clear();
      successGetBar(r.msg);
      emit(LoadedAddNewAd());
    });
  }
}
