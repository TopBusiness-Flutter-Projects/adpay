// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data? data;
  String? msg;
  int? status;

  LoginModel({
    this.data,
    this.msg,
    this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  int? id;
  String? name;
  String? image;
  dynamic? phone;
  String? type;
  int? points;
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
