// import 'package:http/http.dart' as http;

import 'dart:io';

import 'package:adpay/core/models/comment_model.dart';
import 'package:adpay/core/models/get_favourite_model.dart';
import 'package:adpay/core/models/home_vendor_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/base_api_consumer.dart';
import '../api/end_points.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../models/Home_models.dart';
import '../models/add_harag_model.dart';
import '../models/addadressmodel.dart';
import '../models/adsence_Model.dart';
import '../models/catogrie_model.dart';
import '../models/checkUser_model.dart';
import '../models/coins_model.dart';
import '../models/contact_us_model.dart';
import '../models/favourite_model.dart';
import '../models/getCity_ byRegion_model.dart';
import '../models/get_myprofile_model.dart';
import '../models/getregion_model.dart';
import '../models/grage_details_model.dart';
import '../models/grage_model.dart';
import '../models/login_model.dart';
import '../models/logout_model.dart';
import '../models/my_auctions_model.dart';
import '../models/notification_model.dart';
import '../models/order_details.dart';
import '../models/product_details_model.dart';
import '../models/products_model.dart';
import '../models/reset_model.dart';
import '../models/shop_model.dart';
import '../models/shopcatogriesmodel.dart';
import '../models/subcatogrey_model.dart';
import '../models/vendor_order_model.dart';
import '../models/wallet_model.dart';
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

//logout
  Future<Either<Failure, LogoutModel>> logoutAuth() async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.logout,
        body: {},
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(LogoutModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //shopcatogrey
  Future<Either<Failure, GetShopCategoriesModel>> getshopcatogrey() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getshopctogreyUrl,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token
          },
        ),
      );
      return Right(GetShopCategoriesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //postsubcatogrey
  Future<Either<Failure, SubCatogreyModel>> postSubCtogrey({
    required String ?id1,
}) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.subCatogreyUrl,
        body: {
          "id":id1,
        },
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(SubCatogreyModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //getregions
  Future<Either<Failure, GetRegionsModel>> getRegions() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getRegions,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token
          },
        ),
      );
      return Right(GetRegionsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//postsubcatogre
  Future<Either<Failure, GetCityByRegionModel>> getCityByRegion({
    required String ?id1,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.get(
        EndPoints.getCityByRegion,
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(GetCityByRegionModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//resetpass
  Future<Either<Failure, ResetPassModel>> Reset({
    required String phone,
    required String password,
    required String  password_confirmation,

  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.resetUrl,
        body: {
          "phone": phone,
          "password": password,
          "password_confirmation": password_confirmation,
        },
        options: Options(
          headers: {
            'Accept-Language': lan,
            // 'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(ResetPassModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //contact us
  Future<Either<Failure, ContactUsModel>> ContactUs({
    required String subject,
    required String message,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.contactUs,
        body: {"subject": subject, "message": message},
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(ContactUsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //postaddress
  Future<Either<Failure,AddAddressModel>> postAdress({
    required String region,
    required String city,
    required String defaultt,
    required String details,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();
    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.postaddressUrl,
        body: {"region": region, "city": city,"default":defaultt,"details":details},
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(AddAddressModel.fromJson(response));
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

  //addharag
  Future<Either<Failure, AddHaragModel>> AddHarag(
      {required String title_ar,
      required File profileImage,
      required String description_ar,
      required String user_id,
      required String price,
      required String cat_id,
      required String sub_cat_id}) async {
    try {
      var fileName;
      fileName = profileImage.path.split('/').last; // x.png
      var data =
          await MultipartFile.fromFile(profileImage.path, filename: fileName);
      String lan = await Preferences.instance.getSavedLang();
      LoginModel user = await Preferences.instance.getUserModel();
      var response = await dio.post(
        EndPoints.addHarag,
        formDataIsEnabled: true,
        body: {
          "images": data,
          "title_ar": "dog",
          "description_ar": "good",
          "user_id": 20,
          "price": 20.2,
          "cat_id": 2,
          "sub_cat_id": 1,
        },
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );

      return Right(AddHaragModel.fromJson(response));
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

  //coinsurl
  Future<Either<Failure, MyCoinsModel>> getCoins() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.CoinsUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      // print('Response data: ${response.data}');
      return Right(MyCoinsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//getwallet
  Future<Either<Failure, MyWalletModel>> GetWallet() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.WalletUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      // print('Response data: ${response.data}');
      return Right(MyWalletModel.fromJson(response));
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

  //! getHomeVendor

  Future<Either<Failure, HomeVendorScreenModel>> getVendorHomeData() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.homeVendorUrl,
        options: Options(headers: {'Authorization': loginModel.data!.token}),
      );
      return Right(HomeVendorScreenModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, NotificationModel>> getVendorNotifications() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.vendorNotificationsUrl,
        options: Options(headers: {'Authorization': loginModel.data!.token}),
      );
      return Right(NotificationModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, VendorOrdersModel>> getVendorOrders() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.vendorOrdersUrl,
        options: Options(headers: {'Authorization': loginModel.data!.token}),
      );
      return Right(VendorOrdersModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, MainDetailsModel>> getVendorOrderDetails(
      String id) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
        EndPoints.vendorOrderDetailsUrl + id,
        options: Options(headers: {'Authorization': loginModel.data!.token}),
      );
      return Right(MainDetailsModel.fromJson(response));
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
}
