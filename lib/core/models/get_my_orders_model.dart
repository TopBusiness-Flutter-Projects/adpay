
class GetMyOrderModel {
  List<OrderData>? data;
  String? msg;
  int? status;

  GetMyOrderModel({
    this.data,
    this.msg,
    this.status,
  });

  factory GetMyOrderModel.fromJson(Map<String, dynamic> json) => GetMyOrderModel(
    data: json["data"] == null ? [] : List<OrderData>.from(json["data"]!.map((x) => OrderData.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class OrderData {
  int? id;
  String? type;
  String? reference;
  DateTime? date;
  int? total;
  int? userId;
  int? vendorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Detail>? details;

  OrderData({
    this.id,
    this.type,
    this.reference,
    this.date,
    this.total,
    this.userId,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.details,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    id: json["id"],
    type: json["type"],
    reference: json["reference"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    total: json["total"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "reference": reference,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "total": total,
    "user_id": userId,
    "vendor_id": vendorId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  int? id;
  int? productId;
  int? orderId;
  int? qty;
  int? amount;
  int? vat;
  int? discount;
  int? total;
  int? shippingPrice;
  String? shippingType;
  String? region;
  String? area;
  String? addressDetails;
  dynamic createdAt;
  dynamic updatedAt;

  Detail({
    this.id,
    this.productId,
    this.orderId,
    this.qty,
    this.amount,
    this.vat,
    this.discount,
    this.total,
    this.shippingPrice,
    this.shippingType,
    this.region,
    this.area,
    this.addressDetails,
    this.createdAt,
    this.updatedAt,
  });

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
