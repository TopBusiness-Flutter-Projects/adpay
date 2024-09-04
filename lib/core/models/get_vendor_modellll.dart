class GetVendorModel {
  final Data? data;
  final String? msg;
  final int? status;

  GetVendorModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory GetVendorModel.fromJson(Map<String, dynamic> json) {
    return GetVendorModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'],
      status: json['status'],
    );
  }
}

class Data {
  final dynamic? id;
  final String? name;
  final String? image;
  final dynamic? phone;
  final String? type;
  final String? deviceToken;
  final String? session;
  final String? logo;
  final String? banner;
  final String? storeName;
  final String? address;
  final ShopCat? shopCat;
  final List<String>? shopSubCat;
  final String? token;

  Data({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.type,
    required this.deviceToken,
    required this.session,
    required this.logo,
    required this.banner,
    required this.storeName,
    required this.address,
    required this.shopCat,
    required this.shopSubCat,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      phone: json['phone'],
      type: json['type'],
      deviceToken: json['device_token'],
      session: json['session'],
      logo: json['logo'],
      banner: json['banner'],
      storeName: json['store_name'],
      address: json['address'],
      shopCat:
          json['shop_cat'] != null ? ShopCat.fromJson(json['shop_cat']) : null,
      shopSubCat: json['shop_sub_cat'] != null
          ? List<String>.from(json['shop_sub_cat'])
          : null,
      token: json['token'],
    );
  }
}

class ShopCat {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final dynamic? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ShopCat({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShopCat.fromJson(Map<String, dynamic> json) {
    return ShopCat(
      id: json['id'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      status: json['status'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}
