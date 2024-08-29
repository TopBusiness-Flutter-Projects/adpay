// To parse this JSON data, do
//
//     final checkUserModel = checkUserModelFromJson(jsonString);

import 'dart:convert';

CheckUserModel checkUserModelFromJson(String str) => CheckUserModel.fromJson(json.decode(str));

String checkUserModelToJson(CheckUserModel data) => json.encode(data.toJson());

class CheckUserModel {
  Data? data;
  String? msg;
  int? status;

  CheckUserModel({
    this.data,
    this.msg,
    this.status,
  });

  factory CheckUserModel.fromJson(Map<String, dynamic> json) => CheckUserModel(
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
  dynamic? id;
  String? name;
  String? image;
  String? phone;
  String? type;
  String? points;
  String? deviceToken;
  String? session;
  String? token;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
