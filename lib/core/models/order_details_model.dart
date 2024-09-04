// To parse this JSON data, do
//
//     final ordersDetailsModel = ordersDetailsModelFromJson(jsonString);

import 'dart:convert';

OrdersDetailsModel ordersDetailsModelFromJson(String str) =>
    OrdersDetailsModel.fromJson(json.decode(str));

String ordersDetailsModelToJson(OrdersDetailsModel data) =>
    json.encode(data.toJson());

class OrdersDetailsModel {
  Data? data;
  String? msg;
  int? status;

  OrdersDetailsModel({
    this.data,
    this.msg,
    this.status,
  });

  factory OrdersDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrdersDetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "status": status,
      };
}

class Data {
  dynamic? id;
  String? type;
  String? reference;
  DateTime? date;
  dynamic? total;
  dynamic? userId;
  dynamic? vendorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Vendor? vendor;
  List<Detail>? details;

  Data({
    this.id,
    this.type,
    this.reference,
    this.date,
    this.total,
    this.userId,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.vendor,
    this.details,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        reference: json["reference"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        total: json["total"],
        userId: json["user_id"],
        vendorId: json["vendor_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        details: json["details"] == null
            ? []
            : List<Detail>.from(
                json["details"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "reference": reference,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total": total,
        "user_id": userId,
        "vendor_id": vendorId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "vendor": vendor?.toJson(),
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  dynamic? id;
  dynamic? productId;
  dynamic? orderId;
  dynamic? qty;
  dynamic? amount;
  dynamic? vat;
  dynamic? discount;
  dynamic? total;
  dynamic? shippingPrice;
  String? shippingType;
  String? region;
  String? area;
  String? addressDetails;
  dynamic createdAt;
  dynamic updatedAt;
  Product? product;

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
    this.product,
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
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
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
        "product": product?.toJson(),
      };
}

class Product {
  int? id;
  dynamic? vendorId;
  List<String>? images;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  dynamic? price;
  dynamic? discount;
  String? type;
  dynamic? shopCatId;
  String? shopSubCat;
  dynamic? stock;
  Props? props;
  dynamic? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({
    this.id,
    this.vendorId,
    this.images,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.discount,
    this.type,
    this.shopCatId,
    this.shopSubCat,
    this.stock,
    this.props,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        vendorId: json["vendor_id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        price: json["price"],
        discount: json["discount"],
        type: json["type"],
        shopCatId: json["shop_cat_id"],
        shopSubCat: json["shop_sub_cat"],
        stock: json["stock"],
        props: json["props"] == null ? null : Props.fromJson(json["props"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "title_ar": titleAr,
        "title_en": titleEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "price": price,
        "discount": discount,
        "type": type,
        "shop_cat_id": shopCatId,
        "shop_sub_cat": shopSubCat,
        "stock": stock,
        "props": props?.toJson(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Props {
  String? color;
  String? size;
  String? material;
  String? condition;
  String? warranty;
  String? delivery;
  String? freeShipping;
  String? freeReturn;
  String? freeInstallation;
  String? freeExchange;
  String? freeCancellation;
  String? freeGift;
  String? freeSupport;

  Props({
    this.color,
    this.size,
    this.material,
    this.condition,
    this.warranty,
    this.delivery,
    this.freeShipping,
    this.freeReturn,
    this.freeInstallation,
    this.freeExchange,
    this.freeCancellation,
    this.freeGift,
    this.freeSupport,
  });

  factory Props.fromJson(Map<String, dynamic> json) => Props(
        color: json["color"],
        size: json["size"],
        material: json["material"],
        condition: json["condition"],
        warranty: json["warranty"],
        delivery: json["delivery"],
        freeShipping: json["free_shipping"],
        freeReturn: json["free_return"],
        freeInstallation: json["free_installation"],
        freeExchange: json["free_exchange"],
        freeCancellation: json["free_cancellation"],
        freeGift: json["free_gift"],
        freeSupport: json["free_support"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "size": size,
        "material": material,
        "condition": condition,
        "warranty": warranty,
        "delivery": delivery,
        "free_shipping": freeShipping,
        "free_return": freeReturn,
        "free_installation": freeInstallation,
        "free_exchange": freeExchange,
        "free_cancellation": freeCancellation,
        "free_gift": freeGift,
        "free_support": freeSupport,
      };
}

class Vendor {
  int? id;
  String? name;
  String? image;
  dynamic? phone;
  dynamic? verifiedAt;
  dynamic? points;
  String? type;
  String? deviceToken;
  dynamic? status;
  String? session;

  Vendor({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.verifiedAt,
    this.points,
    this.type,
    this.deviceToken,
    this.status,
    this.session,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        verifiedAt: json["verified_at"],
        points: json["points"],
        type: json["type"],
        deviceToken: json["device_token"],
        status: json["status"],
        session: json["session"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "phone": phone,
        "verified_at": verifiedAt,
        "points": points,
        "type": type,
        "device_token": deviceToken,
        "status": status,
        "session": session,
      };
}
