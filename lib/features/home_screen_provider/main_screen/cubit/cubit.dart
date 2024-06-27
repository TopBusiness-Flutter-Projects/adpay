import 'package:adpay/core/remote/service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/ads_vendor_model.dart';
import '../../../../core/models/home_vendor_model.dart';
import '../../../../core/models/login_model.dart';
import '../../../../core/models/my_wallet_vendor_model.dart';
import '../../../../core/models/product_details_model.dart';
import '../../../../core/models/products_model.dart';
import '../../../../core/models/shop_category_vendor_model.dart';
import '../../../../core/models/shopcatogriesmodel.dart';
import '../../../../core/preferences/preferences.dart';
import 'state.dart';

class MainVendorCubit extends Cubit<MainVendorState> {
  MainVendorCubit(this.api) : super(MainVendorInitial());
  static MainVendorCubit get(context) => BlocProvider.of(context);

  ServiceApi api;
  //! screens
  int currentIndex = 0;
  LoginModel? userData;
  //عشان الاسم الي فوق
  getUserModel() {
    emit(LoadingGetUserData());

    Preferences.instance.getUserModel().then((e) {
      userData = e;
      print('.............${e.data?.phone}');
      emit(GetUserData());
    });
  }

  HomeVendorScreenModel? homeVendorScreenModel;
  getVendorHomeData() async {
    emit(LoadingGetHomeVendorState());
    final res = await api.getVendorHomeData();
    res.fold((l) {
      emit(ErrorGetHomeVendorState());
    }, (r) {
      homeVendorScreenModel = r;
      getUserModel();
      emit(LoadedGetHomeVendorState());
    });
  }

  MyWalletVendorModel? myWalletVendor;
  myWalletVendorModel() async {
    emit(LoadingGetMyWalletState());
    final res = await api.myWalletVendorModel();
    res.fold((l) {
      emit(ErrorGetMyWalletState());
    }, (r) {
      myWalletVendor = r;
      emit(LoadedGetMyWalletState());
    });
  }

  onChangeCategory(Category category) {
    currentSelectedCategory = category;
    //! getData depend on category

    emit(OnChangeCategoryVendorState());
    getTotalProductsVendor();
  }

  GetShopCategoriesModel? shopCategoryVendorModel;
  Category? currentSelectedCategory;

  Future getVendorGetShopCategories() async {
    emit(LoadingGetShopCategoryVendorState());
    final res = await api.getVendorGetShopCategories();
    res.fold((l) {
      emit(ErrorGetShopCategoryVendorState());
    }, (r) {
      shopCategoryVendorModel = r;
      currentSelectedCategory = r.data.first;
      getTotalProductsVendor();
      emit(LoadedGetShopCategoryVendorState());
    });
  }

  //! total products
  int currentTotalProductsIndex = 0;
  ProductModel? allProductsModel;
  getTotalProductsVendor() async {
    //currentTotalProductsIndex==0?used:new
    //currentSelectedCategory
    emit(LoadingGetProductsOfVendorState());
    final res = await api.getMyProductsVendor(
        type: currentTotalProductsIndex == 1 ? "new" : "used",
        categoryId: currentSelectedCategory?.id.toString() ?? '');
    res.fold((l) {
      emit(ErrorGetProductsOfVendorState());
    }, (r) {
      // if (r.status == 1) {
      allProductsModel = r;
      print("############ ${r.toString()}");
      // } else {}

      emit(LoadedGetProductsOfVendorState());
    });
  }

  //! get total ads ;
  String currentSelectedTypeOfAds = 'new'.tr(); //!used
  List<String> adsCategory = [
    'new'.tr(),
    'pending'.tr(),
    'complete'.tr(),
  ];
  AdsVendorModel? adsVendorModel;
  getVendorMyAdvertise() async {
    emit(LoadingGetAdsOfVendorState());
    final res = await api.getVendorMyAdvertise(
      type: (currentSelectedTypeOfAds == 'new'.tr()
          ? 'new'
          : currentSelectedTypeOfAds == 'pending'.tr()
              ? 'pending'
              : 'complete'),
    );
    res.fold((l) {
      emit(ErrorGetAdsOfVendorState());
    }, (r) {
      adsVendorModel = r;
      emit(LoadedGetAdsOfVendorState());
    });
  }

  ProductDetailsModel? productsModelDetails;
  Future<void> getProductsDetils({String? id}) async {
    emit(LoadingProductsDetails());
    final response = await api.productsDetailsVendor(id: id);
    response.fold((l) {
      emit(ErrorProductsDetails());
    }, (right) async {
      print("sucess cubit");
      productsModelDetails = right;

      print("loaded");
      emit(LoadedProductsDEtails());
    });
  }

  Future<void> vendorDeleteProduct(
      {required int id, required BuildContext context}) async {
    emit(LoadingDeleteProductsDetails());
    final response = await api.vendorDeleteProduct(productId: id);
    response.fold((l) {
      emit(ErrorDeleteProductsDetails());
    }, (right) async {
      print("sucess cubit");
      Navigator.pop(context);

      print("loaded");
      emit(LoadedDeleteProductsDEtails());
    });
  }

}
