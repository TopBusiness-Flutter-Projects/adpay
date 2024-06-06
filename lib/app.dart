import 'package:adpay/features/home_screen/menue/screens/pocket/cubit/pocket_cubit.dart';
import 'package:adpay/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:adpay/injector.dart' as injector;
import 'features/forget_password/cubit/reset_pass_cubit.dart';
import 'features/home_screen/add_harag/cubit/add_harag_cubit.dart';
import 'features/home_screen/advertisment/cubit/adsence_cubit.dart';
import 'features/home_screen/catogries/cubit/catogries_cubit.dart';
import 'features/home_screen/garage/cubit/grage_cubit.dart';
import 'features/home_screen/grage_details/cubit/grage_details_cubit.dart';
import 'features/home_screen/main_screen/cubit/home_cubit.dart';

import 'features/home_screen/menue/cubit/logout_cubit.dart';
import 'features/home_screen/menue/myprofile/cubit/get_profile_cubit.dart';
import 'features/home_screen/menue/myprofile/edit_profile/cubit/edit_profile_cubit.dart';
import 'features/home_screen/menue/myprofile/myharag/cubit/my_harag_cubit.dart';
import 'features/home_screen/menue/screens/contact_us/cubit/contact_us_cubit.dart';
import 'features/home_screen/menue/screens/favourite/cubit/favourite_cubit.dart';
import 'features/home_screen/menue/screens/mypoints/cubit/points_cubit.dart';
import 'features/home_screen/menue/screens/places/cubit/places_cubit.dart';
import 'features/home_screen/product_details/cubit/products_details_cubit.dart';
import 'features/home_screen/products/cubit/products_cubit.dart';
import 'features/home_screen/shop/cubit/shop_cubit.dart';
import 'features/home_screen_provider/main_screen/cubit/cubit.dart';
import 'features/home_screen_provider/notification_vendor/cubit/cubit.dart';
import 'features/home_screen_provider/order_screen/cubit/cubit.dart';
import 'features/login/cubit/cubit.dart';
import 'features/register_user/cubit/register_user_cubit.dart';
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
            create: (_) => injector.serviceLocator<SignUpUserCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<SignUpVendorCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<CatogriesCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<AdsenceCubit>(),
          ),
          //ProductsCubit
          BlocProvider(
            create: (_) => injector.serviceLocator<ProductsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<GrageCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ShopCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ProductsDetailsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<GrageDetailsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ResetPassCubit>(),
          ),

          BlocProvider(
            create: (_) => injector.serviceLocator<AddHaragCubit>(),
          ),

          BlocProvider(
            create: (_) => injector.serviceLocator<LogoutCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ContactUsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<FavouriteCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<PocketCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<PointsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<GetProfileCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<MyHaragCubit>(),
          ),

          BlocProvider(
            create: (_) => injector.serviceLocator<EditProfileCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<MainVendorCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<NotificationVendorCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<VendorOrderCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<PlacesCubit>(),
          ),

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
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return GetMaterialApp(
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: appTheme(),
                themeMode: ThemeMode.light,
                darkTheme: ThemeData.light(),
                builder: EasyLoading.init(),
                // standard dark theme
                localizationsDelegates: context.localizationDelegates,
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
            }));
  }
}
