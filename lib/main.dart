import 'package:adpay/core/preferences/preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adpay/app.dart';
import 'package:adpay/app_bloc_observer.dart';
import 'package:adpay/core/utils/restart_app_class.dart';
import 'package:adpay/injector.dart' as injector;

import 'firebase_options.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

//TODO
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await injector.setup();
  Bloc.observer = AppBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar', ''),
      fallbackLocale: const Locale('ar', ''),
      child: HotRestartController(child: const Adpay()),
    ),
  );
  await getToken();
}

//! Firebase
getToken() async {
  String? token = await messaging.getToken();
  print('Token : $token');
  await Preferences.instance.setDeviceToken(token);
  return token;
}
