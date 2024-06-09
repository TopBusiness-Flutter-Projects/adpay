class PostAddressModel {
  final Data? data;
  final String? msg;
  final int? status;

  PostAddressModel({this.data, this.msg, this.status});

  factory PostAddressModel.fromJson(Map<String, dynamic> json) {
    return PostAddressModel(
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
  final int? userId;
  final String? region;
  final String? city;
  final String? details;
  final String? defaultStatus;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

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
      userId: json['user_id'] as int?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      details: json['details'] as String?,
      defaultStatus: json['default'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
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
