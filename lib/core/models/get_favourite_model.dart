import 'dart:convert';

class GetFavouriteModel {
  final List<Data>? data;
  final String? msg;
  final int? status;

  GetFavouriteModel({
    this.data,
    this.msg,
    this.status,
  });

  factory GetFavouriteModel.fromJson(Map<String, dynamic> json) {
    return GetFavouriteModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Data.fromJson(item as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
      'msg': msg,
      'status': status,
    };
  }
}

class Data {
  final int? id;
  final int? userId;
  final int? productId;
  final int? auctionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.userId,
    this.productId,
    this.auctionId,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      productId: json['product_id'] as int?,
      auctionId: json['auction_id'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
      'auction_id': auctionId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

