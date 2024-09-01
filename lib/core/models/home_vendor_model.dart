class HomeVendorScreenModel {
  Data? data;
  String? msg;
  int? status;

  HomeVendorScreenModel({
    this.data,
    this.msg,
    this.status,
  });

  factory HomeVendorScreenModel.fromJson(Map<String, dynamic> json) =>
      HomeVendorScreenModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "status": status,
      };
}

class Data {
  List<Slider>? sliders;
  dynamic? walletTotal;
  dynamic? ordersCount;
  dynamic? productsCount;
  dynamic? adsCount;
  dynamic? ordersIncomplete;
  dynamic? ordersComplete;
  dynamic? adsIncomplete;
  dynamic? adsComplete;
  Vendor? vendor;

  Data({
    this.sliders,
    this.walletTotal,
    this.ordersCount,
    this.productsCount,
    this.adsCount,
    this.ordersIncomplete,
    this.ordersComplete,
    this.adsIncomplete,
    this.adsComplete,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sliders: json["sliders"] == null
            ? []
            : List<Slider>.from(
                json["sliders"]!.map((x) => Slider.fromJson(x))),
        walletTotal: json["wallet_total"],
        ordersCount: json["orders_count"],
        productsCount: json["products_count"],
        adsCount: json["ads_count"],
        ordersIncomplete: json["orders_incomplete"],
        ordersComplete: json["orders_complete"],
        adsIncomplete: json["ads_incomplete"],
        adsComplete: json["ads_complete"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "sliders": sliders == null
            ? []
            : List<dynamic>.from(sliders!.map((x) => x.toJson())),
        "wallet_total": walletTotal,
        "orders_count": ordersCount,
        "products_count": productsCount,
        "ads_count": adsCount,
        "orders_incomplete": ordersIncomplete,
        "orders_complete": ordersComplete,
        "ads_incomplete": adsIncomplete,
        "ads_complete": adsComplete,
        "vendor": vendor?.toJson(),
      };
}

class Slider {
  int? id;
  dynamic? status;
  String? image;
  dynamic url;

  Slider({
    this.id,
    this.status,
    this.image,
    this.url,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        status: json["status"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "image": image,
        "url": url,
      };
}

class Vendor {
  int? id;
  String? name;
  String? image;
  dynamic? phone;
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

  Vendor({
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

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        type: json["type"],
        deviceToken: json["device_token"],
        session: json["session"],
        logo: json["logo"],
        banner: json["banner"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        shopCat: json["shop_cat"] == null
            ? null
            : ShopCat.fromJson(json["shop_cat"]),
        shopSubCat: json["shop_sub_cat"] == null
            ? []
            : List<String>.from(json["shop_sub_cat"]!.map((x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "phone": phone,
        "type": type,
        "device_token": deviceToken,
        "session": session,
        "logo": logo,
        "banner": banner,
        "title_ar": titleAr,
        "title_en": titleEn,
        "shop_cat": shopCat?.toJson(),
        "shop_sub_cat": shopSubCat == null
            ? []
            : List<dynamic>.from(shopSubCat!.map((x) => x)),
        "token": token,
      };
}

class ShopCat {
  int? id;
  String? titleAr;
  String? titleEn;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ShopCat({
    this.id,
    this.titleAr,
    this.titleEn,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ShopCat.fromJson(Map<String, dynamic> json) => ShopCat(
        id: json["id"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_ar": titleAr,
        "title_en": titleEn,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
