import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart%20';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/models/addadressmodel.dart';
import '../../../../../../core/models/getCity_ byRegion_model.dart';
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

  GetRegionsModel? maincatogreyModel;


  GetCityByRegionModel? subCatogreyModel;
  GetCityByRegionModel? subcategoriesModel;

  ServiceApi api;
  AddAddressModel ?addressmodel;

  Future<void> Places() async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoadingPlaces());
    final response = await api.postAdress( region: 'منطقة الرياض', city: 'الرياض', defaultt: '1', details: '13 شارع الملك فيصل');
    //
    response.fold((l) {
      emit(ErrorPlaces());
    }, (r) async {
      addressmodel=r;
      print("loaded");
      successGetBar(r.msg);
    });
    emit(LoadedPlaces());
  }
  //
  Future<void> getMainCatogrey(BuildContext context) async {
    emit(LoadingGetCatogreyModel());
    final response = await api.getRegions();
    response.fold((l) {
      emit(ErrorGetCatogreyModel());
    }, (r) async {
      maincatogreyModel = r;
      print("loaded");
      // currentMainCategories = r.data.first;
      successGetBar(r.msg);
      emit(LoadedGetCatogreyModel(categoriesModel: r));
    });
  }
  Region? currentMainCategories;

  onChangeMain(Region? category) {
    subcategoriesModel = null;

    currentMainCategories = category;
    subcatogrey(id: category?.id.toString());
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
}
}
