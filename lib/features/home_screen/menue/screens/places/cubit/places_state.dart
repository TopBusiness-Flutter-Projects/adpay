part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}
final class LoadingPlaces extends PlacesState {}
final class ErrorPlaces extends PlacesState {}
final class LoadedPlaces extends PlacesState {}
class ErrorGetCatogreyModel extends PlacesState {}
class LoadedGetCatogreyModel extends PlacesState {
  final GetRegionsModel categoriesModel;
  LoadedGetCatogreyModel({required this.categoriesModel});
}
class ChangeStateCatogreyModel extends PlacesState {}
class ChangeStateTown extends PlacesState {}

class LoadingGetCatogreyModel extends PlacesState {}

class LoadingSubCatogreyModel extends PlacesState {}
class LoadedSubCatogreyModel extends PlacesState {
  final GetCityByRegionModel ?subcategoriesModel;
  LoadedSubCatogreyModel({required this.subcategoriesModel});
}


class ErrorsubCatogreyModel extends PlacesState {}
class ONChangeMainCategory extends PlacesState {}
class ONChangeSubMainCategory extends PlacesState {}
//
class ErrorGetAdress extends PlacesState{}
class LoadedGetAdress extends PlacesState{
  final GetAddressModel ?adressmodel;
  LoadedGetAdress({required this.adressmodel});
}
class LoadingAdress extends PlacesState{}

