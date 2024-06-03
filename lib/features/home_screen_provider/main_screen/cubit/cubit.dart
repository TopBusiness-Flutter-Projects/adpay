import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/home_vendor_model.dart';
import '../../../../core/models/login_model.dart';
import '../../../../core/preferences/preferences.dart';
import 'state.dart';

class MainVendorCubit extends Cubit<MainVendorState> {
  MainVendorCubit(this.api) : super(MainVendorInitial());

  ServiceApi api;

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
}
