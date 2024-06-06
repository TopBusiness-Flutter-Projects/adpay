import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/home_vendor_model.dart';
import '../../../../core/models/login_model.dart';
import '../../../../core/models/my_wallet_vendor_model.dart';
import '../../../../core/models/shop_category_vendor_model.dart';
import '../../../../core/preferences/preferences.dart';
import 'state.dart';

class MainVendorCubit extends Cubit<MainVendorState> {
  MainVendorCubit(this.api) : super(MainVendorInitial());

  ServiceApi api;
  //! screens
  int currentIndex = 0;
  LoginModel? userData;
  //عشان الاسم الي فوق
  getUserModel() {
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
      //!
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

  ShopCategoryVendorModel? shopCategoryVendorModel;
  getVendorGetShopCategories() async {
    emit(LoadingGetShopCategoryVendorState());
    final res = await api.getVendorGetShopCategories();

    res.fold((l) {
      emit(ErrorGetShopCategoryVendorState());
    }, (r) {
      shopCategoryVendorModel = r;
      emit(LoadedGetShopCategoryVendorState());
    });
  }

  //! total products
  int currentTotalProductsIndex = 0;

  getTotalProductsVendor() {
    //currentTotalProductsIndex==0?used:new
  }
}
