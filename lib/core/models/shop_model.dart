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
  int id;
  String name;
  String image;
  int phone;
  String type;
  String deviceToken;
  dynamic session;
  String logo;
  String banner;
  String titleAr;
  String titleEn;
  ShopCat shopCat;
  List<String> shopSubCat;
  String token;

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
    required this.titleAr,
    required this.titleEn,
    required this.shopCat,
    required this.shopSubCat,
    required this.token,
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
    'shop_cat': shopCat.toJson(),
    'shop_sub_cat': List<dynamic>.from(shopSubCat.map((x) => x)),
    'token': token,
  };
}

class ShopCat {
  int id;
  String titleAr;
  String titleEn;
  int status;
  String createdAt;
  String updatedAt;

  ShopCat({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShopCat.fromJson(Map<String, dynamic> json) => ShopCat(
    id: json['id'],
    titleAr: json['title_ar'],
    titleEn: json['title_en'],
    status: json['status'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title_ar': titleAr,
    'title_en': titleEn,
    'status': status,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}
