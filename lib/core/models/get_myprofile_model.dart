class GetProfileModel {
  final Data data;
  final String msg;
  final int status;

  GetProfileModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) {
    return GetProfileModel(
      data: Data.fromJson(json['data']),
      msg: json['msg'] as String,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'msg': msg,
      'status': status,
    };
  }
}

class Data {
  final int id;
  final String name;
  final String? image;
  final int phone;
  final String password;
  final int verifiedAt;
  final int points;
  final String type;
  final String deviceToken;
  final int status;
  final String session;
  final String createdAt;
  final String updatedAt;
  final int ordersCount;
  final int auctionsCount;
  final int viewAdsCount;

  Data({
    required this.id,
    required this.name,
    this.image,
    required this.phone,
    required this.password,
    required this.verifiedAt,
    required this.points,
    required this.type,
    required this.deviceToken,
    required this.status,
    required this.session,
    required this.createdAt,
    required this.updatedAt,
    required this.ordersCount,
    required this.auctionsCount,
    required this.viewAdsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String?,
      phone: json['phone'] as int,
      password: json['password'] as String,
      verifiedAt: json['verified_at'] as int,
      points: json['points'] as int,
      type: json['type'] as String,
      deviceToken: json['device_token'] as String,
      status: json['status'] as int,
      session: json['session'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      ordersCount: json['orders_count'] as int,
      auctionsCount: json['auctions_count'] as int,
      viewAdsCount: json['view_ads_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'phone': phone,
      'password': password,
      'verified_at': verifiedAt,
      'points': points,
      'type': type,
      'device_token': deviceToken,
      'status': status,
      'session': session,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'orders_count': ordersCount,
      'auctions_count': auctionsCount,
      'view_ads_count': viewAdsCount,
    };
  }
}
