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
import '../models/about_app_model.dart';
import '../models/add_harag_model.dart';
import '../models/add_new_product.dart';
import '../models/add_to_cart_model.dart';
import '../models/addadressmodel.dart';
import '../models/ads_packages_model.dart';
import '../models/ads_vendor_model.dart';
import '../models/adsence_Model.dart';
import '../models/catogrie_model.dart';
import '../models/checkUser_model.dart';
import '../models/coins_model.dart';
import '../models/confirm_order.dart';
import '../models/contact_us_model.dart';
import '../models/delete_card_model.dart';
import '../models/emptycard.dart';
import '../models/favourite_model.dart';
import '../models/getCity_ byRegion_model.dart';
import '../models/get_cart_model.dart';
import '../models/get_my_orders_model.dart';
import '../models/get_myprofile_model.dart';
import '../models/get_vendor_model.dart';
import '../models/getaddress_model.dart';
import '../models/getchat_room_byid.dart';
import '../models/getchat_rooms_model.dart';
import '../models/getregion_model.dart';
import '../models/grage_details_model.dart';
import '../models/grage_model.dart';
import '../models/login_model.dart';
import '../models/logout_model.dart';
import '../models/my_auctions_model.dart';
import '../models/my_wallet_vendor_model.dart';
import '../models/new_order_details_model.dart';
import '../models/notification_model.dart';
import '../models/order_details.dart';
import '../models/order_details_model.dart';
import '../models/product_details_model.dart';
import '../models/products_model.dart';
import '../models/reset_model.dart';
import '../models/response_null_delete.dart';
import '../models/send_message_model.dart';
import '../models/shop_model.dart';
import '../models/shopcatogriesmodel.dart';
import '../models/subcatogrey_model.dart';
import '../models/vendor_order_model.dart';
import '../models/wallet_model.dart';
import '../preferences/preferences.dart';

class ServiceApi {
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
    String? devicetoken = prefs.getString('checkUser') ?? "";
    try {
      var response = await dio.post(
        EndPoints.loginUrl,
        body: {
          "phone": phone,
          "password": password,
          "device_token": '$devicetoken',
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
    String devicetoken = prefs.getString('checkUser') ?? "";
    try {
      var response = await dio.post(
        EndPoints.loginUrlProvider,
        body: {
          "phone": phone,
          "password": password,
          "device_token": '$devicetoken',
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

//delete card
  Future<Either<Failure, DeleteCardModel>> deleteCard({
    required String product_id,
    required String user_id
  }) async {
  Future<Either<Failure, DeleteCardModel>> deleteCard(
      {required String product_id, required String user_id}) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.deleteCard,
        body: {
          "product_id": product_id,
          "user_id": user_id
        },
        body: {"product_id": product_id, "user_id": user_id},
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(DeleteCardModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//addcart
  Future<Either<Failure, AddToCartModel>> addCart({
    required String product_id,
    required String qty,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.addToCart,
        body: {
          "product_id": product_id,
          "qty": qty,
        },
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(AddToCartModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //confirmOrder
  Future<Either<Failure, ConfirmOrderModel>> confirmOrder({
    required List <Cart> confirmList
  }) async {
  Future<Either<Failure, ConfirmOrderModel>> confirmOrder(
      {required List<Cart> confirmList}) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.confrimOrder,
        body: {

          for(int i = 0; i < confirmList.length; i++ )
            "products[$i][product_id]": confirmList[i].productId,
          for(int i = 0; i < confirmList.length; i++ )
            "products[$i][qty]": confirmList[i].qty,
        }, formDataIsEnabled: true,
          for (int i = 0; i < confirmList.length; i++)
            "products[$i][product_id]": confirmList[i].productId,
          for (int i = 0; i < confirmList.length; i++)
            "products[$i][qty]": confirmList[i].qty,
        },
        formDataIsEnabled: true,
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(ConfirmOrderModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //emptycard
  Future<Either<Failure, CartEmptyResponse>> emptycard() async {
    LoginModel user = await Preferences.instance.getUserModel();
    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.emptycard,
        body: {}, formDataIsEnabled: true,
        body: {},
        formDataIsEnabled: true,
        options: Options(
          headers: {
            'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(CartEmptyResponse.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //shopcatogrey
  Future<Either<Failure, GetShopCategoriesModel>> getshopcatogrey() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getShopCtogreyUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetShopCategoriesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//getVendorProfile
  Future<Either<Failure, MainVendorHomeModel>> getVendorProfile({
    required text
  }) async {
  Future<Either<Failure, MainVendorHomeModel>> getVendorProfile(
      {required text}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.vendorProfile + '${(text == null) ? '' : text}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(MainVendorHomeModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //getmyorderes
  Future<Either<Failure, GetMyOrderModel>> getMyorders(
      {String? text = 'complete '}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getmyOrder + '?type=$text',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      print("nononnonononononononononononon");
      print(loginModel.data!.token);
      return Right(GetMyOrderModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //getcart
  Future<Either<Failure, GetCartModel>> getCart() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getCart,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetCartModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//getorderdetails
//   Future<Either<Failure, GetOrderDetails>> getOrdersDetails({
//     int? intt
// }) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.getorderDetails+'?id=$intt',
//         options: Options(
//           headers: {'Authorization': loginModel.data!.token},
//         ),
//       );
//       return Right(GetOrderDetails.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

  //getchatrooms
  Future<Either<Failure, GetChatRoomsModel>> getChatRooms() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    print("dddddddddddddd ${loginModel.data!.token}");
    try {
      final response = await dio.get(
        EndPoints.getChatroomUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetChatRoomsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//getchatroombyid

  Future<Either<Failure, GetChatRoomById>> getRoomById(
      {required String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    // String? id;

    try {
      final response = await dio.get(
        EndPoints.getroombyid + '/${(id == null) ? 1 : id}',
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetChatRoomById.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //postsubcatogrey
  Future<Either<Failure, SubCatogreyModel>> postSubCtogrey({
    required String? id1,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.subCatogreyUrl,
        body: {
          "id": id1,
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

  //postMessage
  Future<Either<Failure, SendMessageModel>> postMessage({
    required String? message,
    required String roomId,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.post(
        EndPoints.sendMessage + '$roomId/sendMessage',
        body: {
          "message": message,
        },
        options: Options(
          headers: {
            // 'Accept-Language': lan,
            'Authorization': user.data!.token!,
          },
        ),
      );
      return Right(SendMessageModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetRegionsModel>> getRegions() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getRegions,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetRegionsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//postsubcatogre
  Future<Either<Failure, GetCityByRegionModel>> getCityByRegion({
    required String? id1,
  }) async {
    LoginModel user = await Preferences.instance.getUserModel();

    String lan = await Preferences.instance.getSavedLang();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Devicetoken = prefs.getString('checkUser');
    try {
      var response = await dio.get(
        EndPoints.getCityByRegion + '?region_id=${(id1 == null) ? '' : id1}',
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
    required String password_confirmation,
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
  Future<Either<Failure, AddAddressModel>> postAdress({
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
        body: {
          "region": region,
          "city": city,
          "default": defaultt,
          "details": details
        },
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
  Future<Either<Failure, LoginModel>> postRegister({
    required String phone,
    required File profileImage,
    required String phoneCode,
    required String name
  }) async {
  Future<Either<Failure, LoginModel>> userRegister(
      {required String phone,
      required File profileImage,
      required String phoneCode,
      required String name}) async {
    String? deviceToken = await Preferences.instance.getDeviceToken();

    try {
      //! images >>Multipare.

      var fileName;
      fileName = profileImage.path
          .split('/')
          .last; // x.png
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
  Future<Either<Failure, LoginModel>> PostEditProfile({required String phone,
    required File profileImage,
    required String phoneCode,
    required String name}) async {
    String? deviceToken = await Preferences.instance.getDeviceToken();

    try {
      //! images >>Multipare.

      var fileName;
      fileName = profileImage.path
          .split('/')
          .last; // x.png
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
  Future<Either<Failure, AddHaragModel>> AddHarag({required String title_ar,
    required File profileImage,
    required String description_ar,
    required String user_id,
    required String price,
    required String cat_id,
    required String sub_cat_id}) async {
    try {
      var fileName;
      fileName = profileImage.path
          .split('/')
          .last; // x.png
      var data =
      await MultipartFile.fromFile(profileImage.path, filename: fileName);
      String lan = await Preferences.instance.getSavedLang();
      LoginModel user = await Preferences.instance.getUserModel();
      var response = await dio.post(
        EndPoints.addHarag,
        formDataIsEnabled: true,
        body: {
          "images": data,
          "title_ar": title_ar,
          "description_ar": description_ar,
          "user_id": user_id,
          "price": price,
          "cat_id": cat_id,
          "sub_cat_id": sub_cat_id,
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
      print("nononnonononononononononononon");
      print(loginModel.data!.token);
      return Right(HomeModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetAddressModel>> getaddress() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.getaddressUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
      );
      return Right(GetAddressModel.fromJson(response));
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

  Future<Either<Failure, OrdersDetailsNewModel>> newDetailsOfOrder(
      {String id = '1'}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await Dio().get(
        EndPoints.orderDetails + id,
        options: Options(
          headers: {
            'Authorization': loginModel.data!.token,
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data.toString());

      return Right(OrdersDetailsNewModel.fromJson(response.data));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//order details
//   Future<Either<Failure, OrdersDetailsNewModel>> getOrderDetails({String? id}) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//     try {
//       final response = await dio.get(
//         EndPoints.orderDetails+ '${id}',
//         options: Options(
//           headers: {'Authorization': loginModel.data!.token},
//         ),
//       );
//       return Right(OrdersDetailsNewModel.fromJson(response));
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }

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

  Future<Either<Failure, ProductDetailsModel>> productsDetailsVendor(
      {String? id}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    try {
      final response = await dio.get(
        EndPoints.vendorProductDetails + '${id}',
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

  //get adv

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

  Future<Either<Failure, MainDetailsModel>> changVendorOrderStatus({
    required String id,
    String type = 'new',
  }) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.post(
        EndPoints.changOrderStatusUrl,
        options: Options(
          headers: {'Authorization': loginModel.data!.token},
        ),
        formDataIsEnabled: true,
        body: {"id": id, "type": type},
      );
      return Right(MainDetailsModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, MyWalletVendorModel>> myWalletVendorModel() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(EndPoints.vendorMyWallet,
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(MyWalletVendorModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetShopCategoriesModel>>
  getVendorGetShopCategories() async {
    // LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(EndPoints.getShopCtogreyUrl,
          options: Options(headers: {
            // 'Authorization': loginModel.data!.token,
          }));
      return Right(GetShopCategoriesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, ProductModel>> getMyProductsVendor({
    required String type,
    required String categoryId,
  }) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
          EndPoints.getMyProductsVendor + "?type=$type&category_id=$categoryId",
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      print('555555555555555 ${response['status'] == 1}');
      if (response['status'] == 1) {
        return Right(ProductModel.fromJson(response));
      } else {
        return Right(ProductModel(data: [], msg: '', status: 0));
      }
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AdsVendorModel>> getVendorMyAdvertise({
    String type = 'new',
  }) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
          EndPoints.getMyAdvertiseVendor + "?type=$type",
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(AdsVendorModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//! vendor sign up
  Future<Either<Failure, LoginModel>> editProfile({required String phone,
    required File profileImage,
    File? logo,
    File? banner,
    required String password,
    required String password_confirmation,
    String? storeName,
    String? address,
  }
      ) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();

    String? deviceToken = await Preferences.instance.getDeviceToken();
    print('=====================${deviceToken}');
    try {
      //! images >>Multipare.
      //! profileImage
      var fileName;
      fileName = profileImage.path
          .split('/')
          .last; // x.png
      var data =
      await MultipartFile.fromFile(profileImage.path, filename: fileName);
      //!
      var dataFileNameBanner;
      var dataLogo;

        //! banner
        var fileNameBanner;
        fileNameBanner = banner?.path
            .split('/')
            .last; // x.png
        dataFileNameBanner = await MultipartFile.fromFile(banner!.path,
            filename: fileNameBanner);

        //! logo
        var fileNameLogo;
        fileNameLogo = logo!
            .path
            .split('/')
            .last; // x.png
        dataLogo = await MultipartFile.fromFile(logo.path, filename: fileNameLogo);


      var response = await dio.post(
        EndPoints.updateProfile,
        formDataIsEnabled: true,

        body:
        {
          "image": data,
          'password': password,
          'logo': dataLogo,
          'banner': dataFileNameBanner,
          'store_name': storeName,
          'address': address,
          'password_confirmation':password_confirmation
        },


    );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

//vendor edit profile
  Future<Either<Failure, LoginModel>> vendorRegister({required String phone,
    required File profileImage,
    File? logo,
    File? banner,
    required String password,
    required String type,
    String? storeName,
    String? address,
    int? shopCatId,
    List<String>? subCategory,
    required String name}) async {
    String? deviceToken = await Preferences.instance.getDeviceToken();
    print('=====================${deviceToken}');
    try {
      //! images >>Multipare.
      //! profileImage
      var fileName;
      fileName = profileImage.path
          .split('/')
          .last; // x.png
      var data =
      await MultipartFile.fromFile(profileImage.path, filename: fileName);
      //!
      var dataFileNameBanner;
      var dataLogo;
      if (type == 'vendor') {
        //! banner
        var fileNameBanner;
        fileNameBanner = banner?.path
            .split('/')
            .last; // x.png
        dataFileNameBanner = await MultipartFile.fromFile(banner!.path,
            filename: fileNameBanner);

        //! logo
        var fileNameLogo;
        fileNameLogo = logo!
            .path
            .split('/')
            .last; // x.png
        dataLogo =
        await MultipartFile.fromFile(logo.path, filename: fileNameLogo);
      }

      var response = await dio.post(
        EndPoints.vendorRegister,
        formDataIsEnabled: true,
        body: type == 'vendor'
            ? {
          "image": data,
          'name': name,
          'phone': phone,
          'password': password,
          'type': type,
          'logo': dataLogo,
          'banner': dataFileNameBanner,
          'store_name': storeName,
          'address': address,
          'device_token': deviceToken ?? '123',
          'shop_cat_id': shopCatId,
          for (int i = 1; i < subCategory!.length; i++)
            'sub_cat_id[$i]': subCategory[i],
        }
            : {
          "image": data,
          'device_token': deviceToken,
          'name': name,
          'phone': phone,
          'password': password,
          'type': type,
        },
                "image": data,
                'name': name,
                'phone': phone,
                'password': password,
                'type': type,
                'logo': dataLogo,
                'banner': dataFileNameBanner,
                'store_name': storeName,
                'address': address,
                'device_token': deviceToken ?? '123',
                'shop_cat_id': shopCatId ?? 1,
                for (int i = 1; i < subCategory!.length; i++)
                  'shop_sub_cat[$i]': subCategory[i],
              }
            : {
                "image": data,
                'device_token': deviceToken ?? '123',
                'name': name,
                'phone': phone,
                'password': password,
                'type': type,
              },
      );

      return Right(LoginModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  //! add new Product
  Future<Either<Failure, AddNewProductModel>> addNewProduct({
    required List<File> images,
    required String title,
    required String describtion,
    required String price,
    required String shopCatId,
    required String shopSubCat,
    required String stock,
    String discount = '0',
    String type = 'new',
  }) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.post(EndPoints.vendorAddProduct,
          formDataIsEnabled: true,
          body: {
            "title_ar": title,
            "title_en": title,
            "description_ar": describtion,
            "description_en": describtion,
            "price": price,
            "discount": discount,
            "stock": stock,
            "type": type,
            "shop_cat_id": shopCatId,
            "shop_sub_cat": shopSubCat,
            for (int i = 0; i < images.length; i++)
              'images[$i]': await MultipartFile.fromFile(images[i].path,
                  filename: images[i].path.split('/').last),
          },
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(AddNewProductModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AddNewProductModel>> updateProduct({
    required int productId,
    required List<File> images,
    required String title,
    required String describtion,
    required String price,
    required String shopCatId,
    required String shopSubCat,
    required String stock,
    String discount = '0',
    String type = 'new',
  }) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.post(EndPoints.vendorUpdateProduct,
          formDataIsEnabled: true,
          body: {
            "product_id": productId,
            "title_ar": title,
            "title_en": title,
            "description_ar": describtion,
            "description_en": describtion,
            "price": price,
            "discount": discount,
            "stock": stock,
            "type": type,
            "shop_cat_id": shopCatId,
            "shop_sub_cat": shopSubCat,
            for (int i = 0; i < images.length; i++)
              'images[$i]': await MultipartFile.fromFile(images[i].path,
                  filename: images[i].path.split('/').last),
          },
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(AddNewProductModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, GetAdPackagesModel>> getAdPackagesModel() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(EndPoints.getAdPackages,
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(GetAdPackagesModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//getaboutapp
  Future<Either<Failure, AboutAppModel>> getAboutApp() async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.get(
          EndPoints.aboutUs,
          options: Options(headers: {'Authorization': loginModel.data!.token})
      );
      return Right(AboutAppModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, ResponseNullModel>> vendorDeleteProduct(
      {required int productId}) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.post(EndPoints.vendorDeleteProduct,
          formDataIsEnabled: true,
          body: {"product_id": productId},
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(ResponseNullModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AddNewProductModel>> addNewAds({
    required File image,
    required String title,
    required String describtion,
    required String video,
    String countViews = '0',
    String packageId = '0',
  }) async {
    LoginModel loginModel = await Preferences.instance.getUserModel();
    try {
      final response = await dio.post(EndPoints.addAdvertise,
          formDataIsEnabled: true,
          body: {
            "title_ar": title,
            "title_en": title,
            "description_ar": describtion,
            "description_en": describtion,
            "count_views": countViews,
            "video": video,
            "package_id": packageId,
            'image': await MultipartFile.fromFile(image.path,
                filename: image.path.split('/').last),
          },
          options: Options(headers: {'Authorization': loginModel.data!.token}));
      return Right(AddNewProductModel.fromJson(response));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
//   Future<Either<Failure, UpdatedModel>> editService(
//       int catId,ServiceToUpdate serviceToUpdate) async {
//     LoginModel loginModel = await Preferences.instance.getUserModel();
//
//     try {
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
