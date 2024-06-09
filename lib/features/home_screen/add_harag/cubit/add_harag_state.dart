part of 'add_harag_cubit.dart';

@immutable
sealed class AddHaragState {}

final class AddHaragInitial extends AddHaragState {}
class LoadingHarag extends AddHaragState{}
class ErrorHarag extends AddHaragState{}
class LoadedHarag extends AddHaragState{
  final AddHaragModel ?addharagModel;
  LoadedHarag({required this.addharagModel});
}
class LoadingAddNewImage extends AddHaragState {}

class LoadedAddNewImage extends AddHaragState {}

class LoadinglogoNewImage extends AddHaragState {}

class LoadedlogoNewImage extends AddHaragState {}

class ErrorGetCatogreyModel extends AddHaragState {}
class LoadedGetCatogreyModel extends AddHaragState {
  final GetShopCategoriesModel categoriesModel;
  LoadedGetCatogreyModel({required this.categoriesModel});
}
class ChangeStateCatogreyModel extends AddHaragState {}
class ChangeStateTown extends AddHaragState {}

class LoadingGetCatogreyModel extends AddHaragState {}

class LoadingSubCatogreyModel extends AddHaragState {}
class LoadedSubCatogreyModel extends AddHaragState {
  final SubCatogreyModel subcategoriesModel;
  LoadedSubCatogreyModel({required this.subcategoriesModel});
}


class ErrorsubCatogreyModel extends AddHaragState {}
class ONChangeMainCategory extends AddHaragState {}
class ONChangeSubMainCategory extends AddHaragState {}
