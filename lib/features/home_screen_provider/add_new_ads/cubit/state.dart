import '../../../../core/models/shopcatogriesmodel.dart';
import '../../../../core/models/subcatogrey_model.dart';

abstract class AddNewAdsState {}

class AddNewAdsInitState extends AddNewAdsState {}

class LoadingGetAdPackages extends AddNewAdsState {}

class LoadedGetAdPackages extends AddNewAdsState {}

class ErrorGetAdPackages extends AddNewAdsState {}

class OnChangeAdPackages extends AddNewAdsState {}

class LoadingAddNewAd extends AddNewAdsState {}

class LoadedAddNewAd extends AddNewAdsState {}

class ErrorAddNewAd extends AddNewAdsState {}

class LoadinglogoNewImage extends AddNewAdsState {}
class LoadedlogoNewImage extends AddNewAdsState {}
