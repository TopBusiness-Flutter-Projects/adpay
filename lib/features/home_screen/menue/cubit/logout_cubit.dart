import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/preferences/preferences.dart';
import '../../../../core/remote/service.dart';
import '../../../../core/utils/dialogs.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  static LogoutCubit get(context) => BlocProvider.of(context);

  LogoutCubit(this.api) : super(LogoutInitial());
  ServiceApi api;
  Future<void> logoutAuthProvider(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoadingLogoutAuth());
    final response = await api.logoutAuth();
    //
    response.fold((l) {
      emit(ErrorLogoutAuth());
    }, (r) async {
      Preferences.instance.clearUserData().then(
              (value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.choosLogin,
                      (route) => false)
      );
      print("loaded");
        successGetBar(r.msg);
      });
      emit(LoadedLogoutAuth());
   }
   Future<void> deleteAccount(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoadingLogoutAuth());
    final response = await api.deleteAccount();
    //
    response.fold((l) {
      emit(ErrorLogoutAuth());
    }, (r) async {
      if(r.status == 1){

        Preferences.instance.clearUserData().then(
                (value) =>
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.choosLogin,
                        (route) => false)
        );
        print("loaded");
        successGetBar(r.msg);
      }else{

        errorGetBar(r.msg);
      }




      });
      emit(LoadedLogoutAuth());
   }
  }


