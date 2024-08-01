// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

// GetCartModel getCartModelFromJson(String str) => GetCartModel.fromJson(json.decode(str));
//
// String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
  List<GetCartModelData>? data;
  String? msg;
  int? status;

  GetCartModel({
    this.data,
    this.msg,
    this.status,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
    data: json["data"] == null ? [] : List<GetCartModelData>.from(json["data"]!.map((x) => GetCartModelData.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class GetCartModelData {
  Vendor? vendor;
  List<Cart>? carts;
  double total;
  GetCartModelData({
    this.vendor,
    this.carts,
    this.total=0,
  });

  factory GetCartModelData.fromJson(Map<String, dynamic> json) => GetCartModelData(
    vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
    carts: json["carts"] == null ? [] : List<Cart>.from(json["carts"]!.map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "vendor": vendor?.toJson(),
    "carts": carts == null ? [] : List<dynamic>.from(carts!.map((x) => x.toJson())),
  };
}

class Cart {
  int? id;
  int? productId;
  int? userId;
  int? vendorId;
  int? qty;
  int? total;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? price;
  String? name;

  Cart({
    this.id,
    this.productId,
    this.userId,
    this.vendorId,
    this.qty,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.price,
    this.name
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    productId: json["product_id"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    qty: json["qty"],
    total: json["total"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    price: json["price"],
      name:json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "user_id": userId,
    "vendor_id": vendorId,
    "qty": qty,
    "total": total,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "price": price,
    "name":name
  };
}

class Vendor {
  int? id;
  String? name;
  String? image;
  int? phone;
  String? type;
  String? deviceToken;
  dynamic session;
  String? logo;
  String? banner;
  String? storeName;
  String? address;
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
    this.storeName,
    this.address,
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
    storeName: json["store_name"],
    address: json["address"],
    shopCat: json["shop_cat"] == null ? null : ShopCat.fromJson(json["shop_cat"]),
    shopSubCat: json["shop_sub_cat"] == null ? [] : List<String>.from(json["shop_sub_cat"]!.map((x) => x)),
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
    "store_name": storeName,
    "address": address,
    "shop_cat": shopCat?.toJson(),
    "shop_sub_cat": shopSubCat == null ? [] : List<dynamic>.from(shopSubCat!.map((x) => x)),
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
