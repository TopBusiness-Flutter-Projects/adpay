import 'Home_models.dart';

class AdsVendorModel {
  List<AdsVendorModelData>? data;
  String? msg;
  int? status;

  AdsVendorModel({
    this.data,
    this.msg,
    this.status,
  });

  factory AdsVendorModel.fromJson(Map<String, dynamic> json) => AdsVendorModel(
        data: json["data"] == null
            ? []
            : List<AdsVendorModelData>.from(
                json["data"]!.map((x) => AdsVendorModelData.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
      };
}

class AdsVendorModelData {
  dynamic? id;
  String? image;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  dynamic? status;
  dynamic? countViews;
  Package? package;
  dynamic? views;
  dynamic? complete;
  String? video;
  dynamic? paymentStatus;
  User? user;

  AdsVendorModelData({
    this.id,
    this.image,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.status,
    this.countViews,
    this.package,
    this.views,
    this.complete,
    this.video,
    this.paymentStatus,
    this.user,
  });

  factory AdsVendorModelData.fromJson(Map<String, dynamic> json) =>
      AdsVendorModelData(
        id: json["id"],
        image: json["image"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        status: json["status"],
        countViews: json["count_views"],
        package:
            json["package"] == null ? null : Package.fromJson(json["package"]),
        views: json["views"],
        complete: json["complete"],
        video: json["video"],
        paymentStatus: json["payment_status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title_ar": titleAr,
        "title_en": titleEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "status": status,
        "count_views": countViews,
        "package": package?.toJson(),
        "views": views,
        "complete": complete,
        "video": video,
        "payment_status": paymentStatus,
        "user": user?.toJson(),
      };
}

class Package {
  int? id;
  dynamic? count;
  dynamic? price;

  Package({
    this.id,
    this.count,
    this.price,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        count: json["count"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "price": price,
      };
}


class ShopCat {
  int? id;
  String? titleAr;
  String? titleEn;
  dynamic? status;
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
