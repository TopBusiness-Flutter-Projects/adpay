// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  List<Datum>? data;
  String? msg;
  int? status;

  GetProfileModel({
    this.data,
    this.msg,
    this.status,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class Datum {
  int? id;
  String? name;
  String? image;
  int? phone;
  String? password;
  int? verifiedAt;
  int? points;
  String? type;
  String? deviceToken;
  int? status;
  String? session;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? ordersCount;
  int? auctionsCount;
  int? viewAdsCount;

  Datum({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.password,
    this.verifiedAt,
    this.points,
    this.type,
    this.deviceToken,
    this.status,
    this.session,
    this.createdAt,
    this.updatedAt,
    this.ordersCount,
    this.auctionsCount,
    this.viewAdsCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
    password: json["password"],
    verifiedAt: json["verified_at"],
    points: json["points"],
    type: json["type"],
    deviceToken: json["device_token"],
    status: json["status"],
    session: json["session"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    ordersCount: json["orders_count"],
    auctionsCount: json["auctions_count"],
    viewAdsCount: json["view_ads_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "phone": phone,
    "password": password,
    "verified_at": verifiedAt,
    "points": points,
    "type": type,
    "device_token": deviceToken,
    "status": status,
    "session": session,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "orders_count": ordersCount,
    "auctions_count": auctionsCount,
    "view_ads_count": viewAdsCount,
  };
}
