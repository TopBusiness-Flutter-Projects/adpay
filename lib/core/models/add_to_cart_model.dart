
class AddToCartModel {
  Data? data;
  String? msg;
  int? status;

  AddToCartModel({this.data, this.msg, this.status});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  int? productId;
  int? userId;
  int? vendorId;
  int? qty;
  int? total;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.productId,
    this.userId,
    this.vendorId,
    this.qty,
    this.total,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'] ?? ''),
      productId: json['product_id'] is int ? json['product_id'] : int.tryParse(json['product_id'] ?? ''),
      userId: json['user_id'] is int ? json['user_id'] : int.tryParse(json['user_id'] ?? ''),
      vendorId: json['vendor_id'] is int ? json['vendor_id'] : int.tryParse(json['vendor_id'] ?? ''),
      qty: json['qty'] is int ? json['qty'] : int.tryParse(json['qty'] ?? ''),
      total: json['total'] is int ? json['total'] : int.tryParse(json['total'] ?? ''),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['vendor_id'] = this.vendorId;
    data['qty'] = this.qty;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

