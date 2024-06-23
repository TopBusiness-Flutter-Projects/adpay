// To parse this JSON data, do
//
//     final getOrderDetails = getOrderDetailsFromJson(jsonString);

import 'dart:convert';

GetOrderDetails getOrderDetailsFromJson(String str) => GetOrderDetails.fromJson(json.decode(str));

String getOrderDetailsToJson(GetOrderDetails data) => json.encode(data.toJson());

class GetOrderDetails {
  GetOrderDetails({
    required this.data,
    required this.msg,
    required this.status,
  });

  List<Datum> data;
  String msg;
  int status;

  factory GetOrderDetails.fromJson(Map<String, dynamic> json) => GetOrderDetails(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.reference,
    required this.date,
    required this.total,
    required this.userId,
    required this.vendorId,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
  });

  int id;
  String type;
  String reference;
  DateTime date;
  int total;
  int userId;
  int vendorId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Detail> details;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    reference: json["reference"],
    date: DateTime.parse(json["date"]),
    total: json["total"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "reference": reference,
    "date": date.toIso8601String(),
    "total": total,
    "user_id": userId,
    "vendor_id": vendorId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.id,
    required this.productId,
    required this.orderId,
    required this.qty,
    required this.amount,
    required this.vat,
    required this.discount,
    required this.total,
    required this.shippingPrice,
    required this.shippingType,
    required this.region,
    required this.area,
    required this.addressDetails,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int productId;
  int orderId;
  int qty;
  int amount;
  int vat;
  int discount;
  int total;
  int shippingPrice;
  String shippingType;
  String region;
  String area;
  String addressDetails;
  dynamic createdAt;
  dynamic updatedAt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    productId: json["product_id"],
    orderId: json["order_id"],
    qty: json["qty"],
    amount: json["amount"],
    vat: json["vat"],
    discount: json["discount"],
    total: json["total"],
    shippingPrice: json["shipping_price"],
    shippingType: json["shipping_type"],
    region: json["region"],
    area: json["area"],
    addressDetails: json["address_details"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "order_id": orderId,
    "qty": qty,
    "amount": amount,
    "vat": vat,
    "discount": discount,
    "total": total,
    "shipping_price": shippingPrice,
    "shipping_type": shippingType,
    "region": region,
    "area": area,
    "address_details": addressDetails,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
