import 'dart:convert';

class RegisterModel {
  final Data? data;
  final String? msg;
  final int? status;

  RegisterModel({
    this.data,
    this.msg,
    this.status,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'] as String?,
      status: json['status'] as int?,
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
  final int? id;
  final String? name;
  final String? image;
  final String? phone;
  final String? type;
  final int? points;
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
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as String?,
      points: json['points'] as int?,
      deviceToken: json['device_token'] as String?,
      session: json['session'] as String?,
      token: json['token'] as String?,
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


