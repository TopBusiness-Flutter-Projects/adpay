import 'dart:convert';

import 'package:adpay/core/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Home_models.dart';
import '../models/checkUser_model.dart';
import '../models/login_model.dart';
import '../utils/app_strings.dart';

class Preferences {
  static final Preferences instance = Preferences._internal();

  Preferences._internal();

  factory Preferences() => instance;

  Future<void> setFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onBoarding', false);
  }

  Future<bool?> getFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? jsonData = prefs.getBool('onBoarding');
    return jsonData;
  }

  Future<void> setUser(LoginModel loginModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'user', jsonEncode(LoginModel.fromJson(loginModel.toJson())));
    print(await getUserModel());
  }

  Future<void> setHome(HomeModel homeModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        'home', jsonEncode(LoginModel.fromJson(homeModel.toJson())));
    print(await getUserModel());
  }

  //set checkuser
  Future<void> setCheckUser(CheckUserModel checkUserModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('CheckUser',
        jsonEncode(CheckUserModel.fromJson(checkUserModel.toJson())));
    print(await getUserModel());
  }

//get user
  Future<CheckUserModel> getCheckUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('CheckUser');
    CheckUserModel checkuserModel;
    if (jsonData != null) {
      checkuserModel = CheckUserModel.fromJson(jsonDecode(jsonData));
    } else {
      checkuserModel = CheckUserModel();
    }
    return checkuserModel;
  }

  //clear
  Future<void> clearShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<LoginModel> getUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('user');
    LoginModel userModel;
    if (jsonData != null) {
      userModel = LoginModel.fromJson(jsonDecode(jsonData));
    } else {
      userModel = LoginModel();
    }
    return userModel;
  }

  Future<void> setDeviceToken(String? token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('device_token', token ?? '');
  }

  Future<String?> getDeviceToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (await preferences.getString('device_token') != null) {
      print('===============${await preferences.getString('device_token')}');
      return await preferences.getString('device_token');
    } else {
      print('===============${await preferences.getString('device_token')}');

      return '';
    }
  }

  Future<HomeModel> getHomeModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonData = preferences.getString('home');
    HomeModel homeModel;
    if (jsonData != null) {
      homeModel = HomeModel.fromJson(jsonDecode(jsonData));
    } else {
      homeModel = HomeModel();
    }
    return homeModel;
  }

  Future<bool> clearAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.clear();
  }

  Future<String> getSavedLang() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(AppStrings.locale) ?? 'ar';
  }

  Future<void> savedLang(String local) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(AppStrings.locale, local);
  }
}
