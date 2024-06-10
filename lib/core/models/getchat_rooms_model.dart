
class GetChatRoomsModel {
  List<GetChatRoomsModelDatum>? data;
  String? msg;
  int? status;

  GetChatRoomsModel({
    this.data,
    this.msg,
    this.status,
  });

  factory GetChatRoomsModel.fromJson(Map<String, dynamic> json) => GetChatRoomsModel(
    data: json["data"] == null ? [] : List<GetChatRoomsModelDatum>.from(json["data"]!.map((x) => GetChatRoomsModelDatum.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class GetChatRoomsModelDatum {
  int? id;
  int? unseenCount;
  FromUser? fromUser;
  ToUser? toUser;
  dynamic model;
  dynamic modelType;
  DateTime? createdAt;

  GetChatRoomsModelDatum({
    this.id,
    this.unseenCount,
    this.fromUser,
    this.toUser,
    this.model,
    this.modelType,
    this.createdAt,
  });

  factory GetChatRoomsModelDatum.fromJson(Map<String, dynamic> json) => GetChatRoomsModelDatum(
    id: json["id"],
    unseenCount: json["unseen_count"],
    fromUser: json["from_user"] == null ? null : FromUser.fromJson(json["from_user"]),
    toUser: json["to_user"] == null ? null : ToUser.fromJson(json["to_user"]),
    model: json["model"],
    modelType: json["model_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unseen_count": unseenCount,
    "from_user": fromUser?.toJson(),
    "to_user": toUser?.toJson(),
    "model": model,
    "model_type": modelType,
    "created_at": createdAt?.toIso8601String(),
  };
}

class FromUser {
  int? id;
  String? name;
  String? image;
  int? phone;
  String? type;
  int? points;
  String? deviceToken;
  String? session;
  String? token;

  FromUser({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.type,
    this.points,
    this.deviceToken,
    this.session,
    this.token,
  });

  factory FromUser.fromJson(Map<String, dynamic> json) => FromUser(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
    type: json["type"],
    points: json["points"],
    deviceToken: json["device_token"],
    session: json["session"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "phone": phone,
    "type": type,
    "points": points,
    "device_token": deviceToken,
    "session": session,
    "token": token,
  };
}

class ToUser {
  int? id;
  String? name;
  String? image;
  int? phone;
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

  ToUser({
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

  factory ToUser.fromJson(Map<String, dynamic> json) => ToUser(
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
    "title_ar": titleAr,
    "title_en": titleEn,
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
