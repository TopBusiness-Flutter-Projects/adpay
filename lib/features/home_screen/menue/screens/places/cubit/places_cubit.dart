import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/models/addadressmodel.dart';
import '../../../../../../core/models/getCity_ byRegion_model.dart';
import '../../../../../../core/models/getaddress_model.dart';
import '../../../../../../core/models/getregion_model.dart';
import '../../../../../../core/remote/service.dart';
import '../../../../../../core/utils/dialogs.dart';
part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit(this.api) : super(PlacesInitial());
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController catIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptoionController = TextEditingController();
  TextEditingController useridController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController SubcatIdController = TextEditingController();

  GetRegionsModel? mainRegion;


  GetCityByRegionModel? subCatogreyModel;
  GetCityByRegionModel? subcategoriesModel;

  ServiceApi api;
  AddAddressModel ?addressmodel;

  Future<void> addNewPlace(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoadingPlaces());
    final response = await api.postAdress( region:currentMainCategories?.nameAr??"" , city: currentSubCategory?.nameAr??"", defaultt: '1', details:discriptoionController.text);
    //
    response.fold((l) {
      emit(ErrorPlaces());
    }, (r) async {
      Navigator.pop(context);
      addressmodel=r;
      print("loaded");
      getPlaces();
      successGetBar(r.msg);
    });
    emit(LoadedPlaces());
  }
  //
  Future<void> getMainRegion(BuildContext context) async {
    emit(LoadingGetCatogreyModel());
    final response = await api.getRegions();
    response.fold((l) {
      emit(ErrorGetCatogreyModel());
    }, (r) async {
      mainRegion = r;
      print("loaded");
      // currentMainCategories = r.data.first;
      successGetBar(r.msg);
      emit(LoadedGetCatogreyModel(categoriesModel: r));
    });
  }
  Region? currentMainCategories;

  onChangeMainRegion(Region? category) {
      subcategoriesModel = null;
print('assssssssssssssss :${currentMainCategories?.nameAr}');
    currentMainCategories = category;
    subcatogrey(id: category?.regionId.toString());
    emit(ONChangeMainCategory());
  }

  Datum? currentSubCategory;
  onchangeSubCategory(Datum? category) {
    currentSubCategory = category;
    emit(ONChangeSubMainCategory());
  }

  Future<void> subcatogrey({String? id}) async {
    emit(LoadingSubCatogreyModel());
    final response = await api.getCityByRegion(id1: id);
    response.fold((l) {
      emit(ErrorGetCatogreyModel());
    }, (r) async {
      subcategoriesModel = r;
      print("loaded");
      successGetBar(r.msg);
      emit(LoadedSubCatogreyModel(subcategoriesModel: r));
    });
  }
  //getplaces
  GetAddressModel? getadressmodel;

  Future<void> getPlaces() async {
    emit(LoadingAdress());
    final response = await api.getaddress();
    //
    response.fold((l) {
      emit(ErrorGetAdress());
    }, (r) async {

      print("sucess cubit");
      getadressmodel = r;
      print("loaded");
      emit(LoadedGetAdress( adressmodel: getadressmodel));
    });
  }

}

