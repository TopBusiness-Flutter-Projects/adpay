
class GetAddressModel {
  final List<AddressData>? data;
  final String? msg;
  final int? status;

  GetAddressModel({this.data, this.msg, this.status});

  factory GetAddressModel.fromJson(Map<String, dynamic> json) {
    return GetAddressModel(
      data: json['data'] != null
          ? List<AddressData>.from(json['data'].map((x) => AddressData.fromJson(x)))
          : null,
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
      'msg': msg,
      'status': status,
    };
  }
}

class AddressData {
  final dynamic? id;
  final dynamic? userId;
  final String? region;
  final String? city;
  final String? details;
  final dynamic? defaultFlag;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AddressData({
    this.id,
    this.userId,
    this.region,
    this.city,
    this.details,
    this.defaultFlag,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['id'],
      userId: json['user_id'],
      region: json['region'],
      city: json['city'],
      details: json['details'],
      defaultFlag: json['default'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'region': region,
      'city': city,
      'details': details,
      'default': defaultFlag,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

