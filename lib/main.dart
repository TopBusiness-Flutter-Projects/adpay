import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adpay/app.dart';
import 'package:adpay/app_bloc_observer.dart';
import 'package:adpay/core/utils/restart_app_class.dart';
import 'package:adpay/injector.dart' as injector;

//TODO :
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await injector.setup();
  Bloc.observer = AppBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('en', ''),
      fallbackLocale: const Locale('ar', ''),
      child: HotRestartController(child: const Adpay()),
    ),
  );
}
