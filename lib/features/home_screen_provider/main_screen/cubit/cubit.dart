import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      emit(GetUserData());
    });
  }
}
