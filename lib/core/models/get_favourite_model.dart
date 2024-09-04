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
      status: json['status'] as dynamic?,
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
  final dynamic? userId;
  final dynamic? productId;
  final dynamic? auctionId;
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
      id: json['id'] as dynamic?,
      userId: json['user_id'] as dynamic?,
      productId: json['product_id'] as dynamic?,
      auctionId: json['auction_id'] as dynamic?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] ,)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] ,)
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
