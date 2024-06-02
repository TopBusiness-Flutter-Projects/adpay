// import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:adpay/core/models/comment_model.dart';
import 'package:adpay/core/models/get_favourite_model.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../api/base_api_consumer.dart';
import '../api/dio_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/Home_models.dart';
import '../models/adsence_Model.dart';
import '../models/catogrie_model.dart';
import '../models/checkUser_model.dart';
import '../models/favourite_model.dart';
import '../models/get_myprofile_model.dart';
import '../models/grage_details_model.dart';
import '../models/grage_model.dart';
import '../models/login_model.dart';
import '../models/my_auctions_model.dart';
import '../models/product_details._modeldart';
import '../models/products_model.dart';
import '../models/register_model.dart';
import '../models/shop_model.dart';
import '../preferences/preferences.dart';

class ServiceApi {
  String? Devicetoken;

  final BaseApiConsumer dio;

  ServiceApi(this.dio);
//   if (dio is DioConsumer) {
//   (dio as DioConsumer).client.interceptors.add(PrettyDioLogger(
//   requestHeader: true,
//   requestBody: true,
//   responseBody: true,
//   responseHeader: false,
//   compact: false,
//   ));
//   }
// }

  Future<Either<Failure, LoginModel>> loginAuth({
    required String phone,
    required String password,
    required String device_token,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Devicetoken = prefs.getString('checkUser' ?? "");
    try {
      var response = await dio.post(
        EndPoints.loginUrl,
        body: {
          "phone": phone,
          "password": password,
          "device_token": '$Devicetoken',
        },
        options: Options(
          headers: {'Accept-Language': lan},
        ),
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, LoginModel>> loginAuthProvider({
    required String phone,
    required String password,
    required String device_token,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.loginUrlProvider,
        body: {
          "phone": phone,
          "password": password,
          "device_token": '$Devicetoken',
        },
        options: Options(
          headers: {'Accept-Language': lan},
        ),
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//checkuser
  Future<Either<Failure, CheckUserModel>> CheckUser({
    required String phone,
  }) async {
    String lan = await Preferences.instance.getSavedLang();
    try {
      var response = await dio.post(
        EndPoints.CheckUser,
        body: {"phone": phone},
        options: Options(
          headers: {'Accept-Language': lan},
        ),
      );
      return Right(CheckUserModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //post favourite
  Future<Either<Failure, FavouriteModel>> FavouriteStore(
      {bool isAuction = false, String? productId}) async {
    String lan = await Preferences.instance.getSavedLang();

    LoginModel user = await Preferences.instance.getUserModel();
    try {
      var response = await dio.post(
        EndPoints.Favourite,
        body: isAuction
            ? {
                "auction_id": productId,
              }
            : {
                "product_id": productId,
              },
        formDataIsEnabled: true,
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(FavouriteModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //comment
  Future<Either<Failure, CommentsModel>> PostComment({
    bool isComment = true,
    String? auction_id,
    String? comment,
    String? type,
    String? comment_id,
  }) async {
    String lan = await Preferences.instance.getSavedLang();

    LoginModel user = await Preferences.instance.getUserModel();
    try {
      var response = await dio.post(
        EndPoints.CommentsUrl,
        body: isComment
            ? {
                "auction_id": auction_id,
                "comment": comment,
                "type": "comment",
              }
            : {
                "auction_id": auction_id,
                "comment": comment,
                "type": "reply",
                "comment_id": comment_id
              },
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(CommentsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //register
  Future<Either<Failure, LoginModel>> postRegister(
      {required String phone,
      required File profileImage,
      required String phoneCode,
      required String name}) async {
    String? deviceToken = await Preferences.instance.getDeviceToken();

    try {
      //! images >>Multipare.

      var fileName;
      fileName = profileImage.path.split('/').last; // x.png
      var data =
          await MultipartFile.fromFile(profileImage.path, filename: fileName);

      var response = await dio.post(
        EndPoints.registerUrl,
        formDataIsEnabled: true,
        body: {
          'password': phone,
          'phone': phoneCode,
          "image": data,
          'name': name,
          'device_token': deviceToken,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //edit profile
  Future<Either<Failure, LoginModel>> PostEditProfile(
      {required String phone,
      required File profileImage,
      required String phoneCode,
      required String name}) async {
    String? deviceToken = await Preferences.instance.getDeviceToken();

    try {
      //! images >>Multipare.

      var fileName;
      fileName = profileImage.path.split('/').last; // x.png
      var data =
          await MultipartFile.fromFile(profileImage.path, filename: fileName);

      var response = await dio.post(
        EndPoints.EditProfileUrl,
        formDataIsEnabled: true,
        body: {
          'password': phone,
          'phone': phoneCode,
          "image": data,
          'name': name,
          'device_token': deviceToken,
        },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//   //
//   // Future<Either<Failure, ServiceStoreModel>> postServiceStore(ServiceModel serviceModel) async {
//   //   LoginModel loginModel = await Preferences.instance.getUserModel();
//   //
//   //   try {
//   //     List<MultipartFile> images = [];
//   //     for (int i = 0; i < serviceModel.images.length; i++) {
//   //
//   //       var image =  await MultipartFile.fromFile(serviceModel.images[i]!.path)  ;
//   //       images.add(image);
//   //     }      List phones = [];
//   //     for(int i = 0 ; i<serviceModel.phones.length ; i++){
//   //       phones.add(serviceModel.phones[i]);
//   //     }
//   //     final response = await dio.post(
//   //       EndPoints.serviceStoreUrl,
//   //       formDataIsEnabled: true,
//   //       options: Options(
//   //         headers: {'Authorization': loginModel.data!.accessToken!},
//   //       ),
//   //       body: {
//   //         'name': serviceModel.name,
//   //         "category_id":serviceModel.category_id,
//   //         "sub_category_id":serviceModel.sub_category_id,
//   //         "city_id":serviceModel.cityId,
//   //         "phones[]": phones,
//   //         "details":serviceModel.details,
//   //         "logo": await MultipartFile.fromFile(serviceModel.logo.path),
//   //         "location":serviceModel.location,
//   //         "images[]":images,
//   //         "longitude":serviceModel.longitude,
//   //         "latitude":serviceModel.latitude,
//   //       },
//   //     );
//   //     return Right(ServiceStoreModel.fromJson(response));
//   //   } on ServerException {
//   //
//   //     return Left(ServerFailure());
//   //   }
//   // }
//
//   Future<Either<Failure,UpdatedModel >> edit(ServiceToUpdate serviceToUpdate,catId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//       List<MultipartFile> images = [];
//       for (int i = 0; i < serviceToUpdate.images!.length; i++) {
//
//         var image =  await MultipartFile.fromFile(serviceToUpdate.images?[i]!.path)  ;
//         images.add(image);
//       }      List phones = [];
//       for(int i = 0 ; i<serviceToUpdate.phones!.length ; i++){
//         phones.add(serviceToUpdate.phones?[i]);
//       }
//       final response = await dio.post(
//         EndPoints.editServicesUrl + catId.toString(),
//
//         formDataIsEnabled: true,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           'name': serviceToUpdate.name,
//           "category_id":serviceToUpdate.categoryId,
//          // "sub_category_id":1,
//           "phones[]": phones,
//           "details":serviceToUpdate.details,
//            "city_id":serviceToUpdate.cityId,
//           "longitude":serviceToUpdate.longitude,
//           "latitude":serviceToUpdate.latitude,
//           "logo": serviceToUpdate.logo,
//           "location":serviceToUpdate.location,
//           "images[]":images,
//         },
//       );
//       return Right(UpdatedModel.fromJson(response));
//     } on ServerException {
//
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, RateResponseModel>> postRate({required serviceId,required value,comment}) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//
//       final response = await dio.post(
//         EndPoints.rateUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           'service_id': serviceId,
//           "value":value,
//           "comment":comment
//         },
//       );
//       return Right(RateResponseModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, LoginModel>> postEditProfile(
//       String name) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//       final response = await dio.post(
//         EndPoints.updateProfileUrl,
//         options: Options(headers: {"Authorization":loginModel.data!.accessToken!}),
//         body: {
//           'name': name,
//           "phone":loginModel.data?.user?.phone,
//         },
//       );
//
//       return Right(LoginModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, LoginModel>> postLogin(
//       String phone, String phoneCode) async {
//     try {
//       final response = await dio.post(
//         EndPoints.loginUrl,
//         body: {
//           'phone': phone,
//         },
//       );
//       return Right(LoginModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, HomeModel>> homeData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.homeUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data?.accessToken!},
//         ),
//       );
//       return Right(HomeModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
  Future<Either<Failure, HomeModel>> homeData() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.homeUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(HomeModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//getfavourite
  Future<Either<Failure, GetFavouriteModel>> GetFavourite() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getfavouriteUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetFavouriteModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //getProfile
  Future<Either<Failure, GetProfileModel>> getProfile() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getprofileUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      // print('Response data: ${response.data}');

      return Right(GetProfileModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //myauctions
  Future<Either<Failure, MyAuctionsModel>> GetMyAuctions() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    String userid = loginModel?.data?.id.toString() ?? "";
    try {
      final response = await dio.get(
        EndPoints.getmyauctionsUrl +
            '?user_id=${(userid == null) ? '' : userid}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(MyAuctionsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //catogries
  Future<Either<Failure, CategoriesModel>> CategoriesData() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.CatogriesListUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(CategoriesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //adenceList
  Future<Either<Failure, AdsenceModel>> ADsenceData() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.AdsListUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(AdsenceModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //products
  Future<Either<Failure, ProductModel>> ProductsData({String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.ProductListUrl + '?cat_id=${(id == null) ? '' : id}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(ProductModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //productdetails
  Future<Either<Failure, ProductDetailsModel>> ProductsDetails(
      {String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.ProductDetails + '${id}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(ProductDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//gragedetails
  Future<Either<Failure, GradeDetailsModel>> GrageDetails({String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.AuctionsDetails + '${id}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GradeDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//grage list
  Future<Either<Failure, GrageModel>> grageList({String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.GrageListUrl + '?cat_id=${id ?? ''}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GrageModel?.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //shoplist
  Future<Either<Failure, ShopModel>> ShopList({String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.ShopsList + '?cat_id=${id ?? ''}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(ShopModel?.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//   Future<Either<Failure, UpdatedModel>> editService(
//       int catId,ServiceToUpdate serviceToUpdate) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
//
//       List<MultipartFile> images = [];
//       for (int i = 0; i < serviceToUpdate.images!.length; i++) {
//
//         var imageFile = serviceToUpdate.images![i];
//         if (imageFile.path.startsWith('http')) {
//           // This is a remote URL, so we need to download the image and save it locally before uploading it
//           var response = await http.get(Uri.parse(imageFile.path));
//           var bytes = response.bodyBytes;
//           var tempDir = await getTemporaryDirectory();
//           var filePath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
//           await File(filePath).writeAsBytes(bytes);
//           var image = await MultipartFile.fromFile(filePath);
//           images.add(image);
//         } else {
//           // This is a local file, so we can create a MultipartFile object from it
//           var image = await MultipartFile.fromFile(imageFile.path);
//           images.add(image);
//         }
//       }
//       final response = await dio.post(
//         EndPoints.editServicesUrl + catId.toString(),
//
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         body: {
//           "name":serviceToUpdate.name,
//           "category_id":serviceToUpdate.categoryId,
//           "sub_category_id":serviceToUpdate.subCategoryId,
//           "phones[0]":serviceToUpdate.phones?[0],
//           "phones[1]":serviceToUpdate.phones?[1],
//           "details":serviceToUpdate.details,
//          // "logo":serviceToUpdate.logo,
//           //"logo": await MultipartFile.fromFile(serviceToUpdate.logo!),
//           "logo": !serviceToUpdate.logo!.path.startsWith("http")?await MultipartFile.fromFile(serviceToUpdate.logo!.path):null,
//           "location":serviceToUpdate.location,
//           "images[]":images,
//
//         }
//
//       );
//      print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//       print(response);
//       return Right(UpdatedModel.fromJson(response));
//     } on ServerException {
//       print("erroooooor");
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, CategoriesServicesModel>> servicesSearchData(
//       int catId,searchKey) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.servicesUrl + catId.toString(),
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//       );
//       return Right(CategoriesServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, FavoriteModel>>getFavoriteData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.favoriteUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(FavoriteModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure,CitiesModel>> getCities()async{
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try{
//       final response = await dio.get(
//           EndPoints.citiesUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CitiesModel.fromJson(response));
//     } on ServerException{
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, FavoriteModel>>getFavoriteSearchData(searchKey) async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.favoriteUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//       );
//
//       return Right(FavoriteModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, MyServicesModel>>getMyServicesData() async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.myServicesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(MyServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//
//   Future<Either<Failure, MyServicesModel>>getMyServicesSearchData(searchKey) async {
//
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//
//       final response = await dio.get(
//         EndPoints.myServicesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//         queryParameters: {"search_key":searchKey}
//
//       );
//
//       return Right(MyServicesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   // Future<Either<Failure, NotificationModel>>getNotifications() async {
//   //
//   //   LoginModel loginModel = await Preferences.instance.getUserModel();
//   //   try {
//   //
//   //     final response = await dio.get(
//   //         EndPoints.notificationUrl ,
//   //         options: Options(
//   //           headers: {'Authorization': loginModel.data!.accessToken!},
//   //         ),
//   //
//   //
//   //     );
//   //
//   //     return Right(NotificationModel.fromJson(response));
//   //   } on ServerException {
//   //     return Left(ServerFailure());
//   //   }
//   // }
//   //
//
//
//
//   Future<Either<Failure, CategoriesModel>>getCategoriesData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.categoriesUrl ,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//       return Right(CategoriesModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure, SettingModel>> getSettingData() async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.settingUrl,
//         options: Options(
//           headers: {'Authorization': loginModel.data!.accessToken!},
//         ),
//       );
//
//       return Right(SettingModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
//
//   Future<Either<Failure,AddToFavouriteResponseModel>> addToFavourite(serviceId) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
// try{
//
//   final response = await dio.post(
//       EndPoints.addToFavouriteUrl,
//       options: Options(
//         headers: {"Authorization":loginModel.data!.accessToken},
//       ),
//       body: {"service_id":serviceId}
//   );
//   return Right(AddToFavouriteResponseModel.fromJson(response));
// } on ServerException{
//   return Left(ServerFailure());
// }
//   }

  // Future<Either<Failure, SearchModel>> search(searchKey) async {
  //   LoginModel loginModel = await Preferences.instance.getUserModel();
  //
  //   try {
  //     final response = await dio.get(
  //       EndPoints.searchUrl+searchKey,
  //       options: Options(
  //         headers: {'Authorization': loginModel.data!.accessToken!},
  //       ),
  //     );
  //     return Right(SearchModel.fromJson(response));
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
