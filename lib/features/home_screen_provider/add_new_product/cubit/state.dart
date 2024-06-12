import '../../../../core/models/shopcatogriesmodel.dart';
import '../../../../core/models/subcatogrey_model.dart';

abstract class AddNewProductState {}

class AddAddNewProductInitState extends AddNewProductState {}

class LoadinglogoNewImage extends AddNewProductState {}

class LoadedlogoNewImage extends AddNewProductState {}

class ErrorGetCatogreyModel extends AddNewProductState {}

class LoadedGetCatogreyModel extends AddNewProductState {
  final GetShopCategoriesModel categoriesModel;
  LoadedGetCatogreyModel({required this.categoriesModel});
}

class ChangeStateCatogreyModel extends AddNewProductState {}

class ChangeStateTown extends AddNewProductState {}

class LoadingGetCatogreyModel extends AddNewProductState {}

class LoadingSubCatogreyModel extends AddNewProductState {}

class LoadedSubCatogreyModel extends AddNewProductState {
  final SubCatogreyModel subcategoriesModel;
  LoadedSubCatogreyModel({required this.subcategoriesModel});
}

class ErrorsubCatogreyModel extends AddNewProductState {}

class ONChangeMainCategory extends AddNewProductState {}

class ONChangeSubMainCategory extends AddNewProductState {}

class ONChangeType extends AddNewProductState {}
class LoadingAddNewProduct extends AddNewProductState {}
class LoadedAddNewProduct extends AddNewProductState {}
class ErrorAddNewProduct extends AddNewProductState {}
