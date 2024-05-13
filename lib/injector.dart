import 'package:adpay/features/home_screen/presentation/controller/adesence/adsence_cubit.dart';
import 'package:adpay/features/home_screen/presentation/controller/home/home_cubit.dart';
import 'package:adpay/features/on_boarding/cubit/onboarding_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:adpay/core/remote/service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/home_screen/presentation/controller/Catogries/catogries_cubit.dart';
import 'features/home_screen/presentation/controller/products/products_cubit.dart';
import 'features/login/cubit/cubit.dart';
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
    () => LoginCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => SignUpVendorCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => HomeCubit(
     serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => CatogriesCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => AdsenceCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
        () => ProductsCubit(
      serviceLocator(),
    ),
  );

  // serviceLocator.registerFactory(
  //   () => ProfileCubit(
  //      serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory(
  //   () => FavoriteCubit(
  //     serviceLocator(),
  //   ),
  // );
  // serviceLocator.registerFactory(
  //   () => HomeCubit(
  //     serviceLocator(),
  //   ),
  // );
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
