import 'dart:convert';

class RegisterModel {
  final Data? data;
  final String? msg;
  final dynamic? status;

  RegisterModel({
    this.data,
    this.msg,
    this.status,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'] as String?,
      status: json['status'] as dynamic?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'msg': msg,
      'status': status,
    };
  }
}

class Data {
  final dynamic? id;
  final String? name;
  final String? image;
  final String? phone;
  final String? type;
  final dynamic? points;
  final String? deviceToken;
  final String? session;
  final String? token;

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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ,
      name: json['name'] ,
      image: json['image'],
      phone: json['phone'],
      type: json['type'] ,
      points: json['points'] ,
      deviceToken: json['device_token'],
      session: json['session'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'phone': phone,
      'type': type,
      'points': points,
      'device_token': deviceToken,
      'session': session,
      'token': token,
    };
  }
}
