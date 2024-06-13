import 'dart:convert';

class GetCartModel {
  final List<Data> data;
  final String msg;
  final int status;

  GetCartModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory GetCartModel.fromJson(dynamic json) {
    if (json is String) {
      return GetCartModel.fromMap(jsonDecode(json));
    } else if (json is Map<String, dynamic>) {
      return GetCartModel.fromMap(json);
    } else {
      throw ArgumentError('Expected a String or a Map<String, dynamic>');
    }
  }

  String toJson() => json.encode(toMap());

  factory GetCartModel.fromMap(Map<String, dynamic> json) => GetCartModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "msg": msg,
    "status": status,
  };
}

class Data {
  final Vendor vendor;
  final List<Cart> carts;
  final int price;

  Data({
    required this.vendor,
    required this.carts,
    required this.price,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    vendor: Vendor.fromMap(json["vendor"]),
    carts: List<Cart>.from(json["carts"].map((x) => Cart.fromMap(x))),
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "vendor": vendor.toMap(),
    "carts": List<dynamic>.from(carts.map((x) => x.toMap())),
    "price": price,
  };
}

class Vendor {
  final int id;
  final String name;
  final String image;
  final int phone;
  final String type;
  final String deviceToken;
  final String? session;
  final String logo;
  final String banner;
  final String storeName;
  final String address;
  final ShopCat shopCat;
  final List<String> shopSubCat;
  final String token;

  Vendor({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.type,
    required this.deviceToken,
    this.session,
    required this.logo,
    required this.banner,
    required this.storeName,
    required this.address,
    required this.shopCat,
    required this.shopSubCat,
    required this.token,
  });

  factory Vendor.fromMap(Map<String, dynamic> json) => Vendor(
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
    shopCat: ShopCat.fromMap(json["shop_cat"]),
    shopSubCat: List<String>.from(json["shop_sub_cat"].map((x) => x)),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
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
    "shop_cat": shopCat.toMap(),
    "shop_sub_cat": List<dynamic>.from(shopSubCat.map((x) => x)),
    "token": token,
  };
}

class ShopCat {
  final int id;
  final String titleAr;
  final String titleEn;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShopCat({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShopCat.fromMap(Map<String, dynamic> json) => ShopCat(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Cart {
  final int id;
  final int productId;
  final int userId;
  final int vendorId;
  final int qty;
  final int total;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cart({
    required this.id,
    required this.productId,
    required this.userId,
    required this.vendorId,
    required this.qty,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
    id: json["id"],
    productId: json["product_id"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    qty: json["qty"],
    total: json["total"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "user_id": userId,
    "vendor_id": vendorId,
    "qty": qty,
    "total": total,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
