import 'dart:io';

import 'package:adpay/core/remote/service.dart';
import 'package:adpay/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/models/ads_packages_model.dart';
import 'state.dart';

class AddNewAdsCubit extends Cubit<AddNewAdsState> {
  AddNewAdsCubit(this.api) : super(AddNewAdsInitState());

  ServiceApi api;

  GetAdPackagesModel? adPackagesModel;
  GetAdPackagesModelData? currentPackage;

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
  TextEditingController nameController = TextEditingController();
  TextEditingController videoLinkController = TextEditingController();
  File? selectedImage;

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

      successGetBar(r.msg);
      emit(LoadedAddNewAd());
    });
  }
}
