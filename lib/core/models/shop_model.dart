import 'home_vendor_model.dart';

class ShopModel {
  List<Data> data;

  ShopModel({
    required this.data,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  int? id;
  String? name;
  String? image;
  String? phone;
  String? type;
  String? deviceToken;
  dynamic session;
  String? logo;
  String? banner;
  String? titleAr;
  String? titleEn;
  ShopCat? shopCat;
  List<String>? shopSubCat;
  String? token;

  Data({
     this.id,
     this.name,
     this.image,
     this.phone,
     this.type,
     this.deviceToken,
     this.session,
     this.logo,
     this.banner,
     this.titleAr,
     this.titleEn,
     this.shopCat,
     this.shopSubCat,
     this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        phone: json['phone'],
        type: json['type'],
        deviceToken: json['device_token'],
        session: json['session'],
        logo: json['logo'],
        banner: json['banner'],
        titleAr: json['title_ar'],
        titleEn: json['title_en'],
        shopCat: ShopCat.fromJson(json['shop_cat']),
        shopSubCat: List<String>.from(json['shop_sub_cat'].map((x) => x)),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'phone': phone,
        'type': type,
        'device_token': deviceToken,
        'session': session,
        'logo': logo,
        'banner': banner,
        'title_ar': titleAr,
        'title_en': titleEn,
        'shop_cat': shopCat!.toJson(),
        'shop_sub_cat': List<dynamic>.from(shopSubCat!.map((x) => x)),
        'token': token,
      };
}
