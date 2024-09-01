class AddAddressModel {
  final Data? data;
  final String? msg;
  final int? status;

  AddAddressModel({this.data, this.msg, this.status});

  factory AddAddressModel.fromJson(Map<String, dynamic> json) {
    return AddAddressModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'] ,
      status: json['status'] ,
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
  final dynamic? userId;
  final String? region;
  final String? city;
  final String? details;
  final String? defaultStatus;
  final String? updatedAt;
  final String? createdAt;
  final dynamic? id;

  Data({
    this.userId,
    this.region,
    this.city,
    this.details,
    this.defaultStatus,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['user_id'],
      region: json['region'],
      city: json['city'],
      details: json['details'] ,
      defaultStatus: json['default'] ,
      updatedAt: json['updated_at'] ,
      createdAt: json['created_at'] ,
      id: json['id'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'region': region,
      'city': city,
      'details': details,
      'default': defaultStatus,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
