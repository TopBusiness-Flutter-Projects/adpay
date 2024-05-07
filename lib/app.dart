import 'package:adpay/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:adpay/injector.dart' as injector;

import 'features/home_screen/presentation/controller/home_cubit.dart';
import 'features/home_screen/presentation/screen/home_screen.dart';
import 'features/login/cubit/cubit.dart';
import 'features/vendor_sign_up/cubit/cubit.dart';

class Adpay extends StatefulWidget {
  const Adpay({Key? key}) : super(key: key);

  @override
  State<Adpay> createState() => _AdpayState();
}

class _AdpayState extends State<Adpay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector.serviceLocator<OnboardingCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<SignUpVendorCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeCubit>()..getUserModel(),
          ),
          // BlocProvider(
          //   create: (_) => injector.serviceLocator<PostsCubit>(),
          // ),
          // BlocProvider(
          //   create: (_) => injector.serviceLocator<ProfileCubit>(),
          // ),
          // BlocProvider(
          //   create: (_) => injector.serviceLocator<FavoriteCubit>(),
          // ),
          //
          // BlocProvider(
          //   create: (_) => injector.serviceLocator<PrivacyCubit>(),
          // ),
          //
          //
          // BlocProvider(
          //   create: (_) => injector.serviceLocator<AddServiceCubit>(),
          // ),
        ],
        child: GetMaterialApp(
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: appTheme(),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.light(),
          builder: EasyLoading.init(),

          // standard dark theme
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          // title: AppStrings.appName,
          // onGenerateRoute: AppRoutes.onGenerateRoute,
          home:HomeScreen()
        ));
  }
}
