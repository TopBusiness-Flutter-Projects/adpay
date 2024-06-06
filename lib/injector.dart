import 'package:adpay/features/home_screen/menue/cubit/logout_cubit.dart';
import 'package:adpay/features/home_screen/menue/screens/pocket/cubit/pocket_cubit.dart';
import 'package:adpay/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:adpay/core/remote/service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/forget_password/cubit/reset_pass_cubit.dart';
import 'features/home_screen/add_harag/cubit/add_harag_cubit.dart';
import 'features/home_screen/advertisment/cubit/adsence_cubit.dart';
import 'features/home_screen/catogries/cubit/catogries_cubit.dart';
import 'features/home_screen/garage/cubit/grage_cubit.dart';
import 'features/home_screen/grage_details/cubit/grage_details_cubit.dart';
import 'features/home_screen/main_screen/cubit/home_cubit.dart';
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

// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////
  //
  serviceLocator.registerFactory(() => OnboardingCubit(
      // serviceLocator(),
      ));

  serviceLocator.registerFactory(
    () => LoginCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GetProfileCubit(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => FavouriteCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => MyHaragCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => PointsCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => PocketCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => EditProfileCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => PlacesCubit(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SignUpVendorCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => HomeCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => CatogriesCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => AdsenceCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ProductsCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GrageCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ShopCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ProductsDetailsCubit(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => GrageDetailsCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SignUpUserCubit(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => MainVendorCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => LogoutCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ContactUsCubit(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => AddHaragCubit(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => NotificationVendorCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => VendorOrderCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => ResetPassCubit(
      serviceLocator(),
    ),
  );

  // serviceLocator.registerFactory(
  //   () => PostsCubit(
  //     serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory(
  //       () => EditProfileCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => MyPostsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => AddServiceCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => DetailsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  //
  // serviceLocator.registerFactory(
  //       () => PrivacyCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => ContactUsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );

  ///////////////////////////////////////////////////////////////////////////////

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
