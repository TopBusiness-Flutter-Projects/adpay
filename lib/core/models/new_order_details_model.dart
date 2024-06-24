
import 'home_vendor_model.dart';

class OrdersDetailsNewModel {
  final NewOrderDetailsData? data;
  final String? msg;
  final int? status;

  OrdersDetailsNewModel({
    this.data,
    this.msg,
    this.status,
  });

  factory OrdersDetailsNewModel.fromJson(Map<String, dynamic> json) => OrdersDetailsNewModel(
    data: json["data"] == null ? null : NewOrderDetailsData.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "msg": msg,
    "status": status,
  };
}

class NewOrderDetailsData {
  final int? id;
  final String? type;
  final String? reference;
  final DateTime? date;
  final int? total;
  final int? userId;
  final int? vendorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Vendor? vendor;
  final List<Detail>? details;

  NewOrderDetailsData({
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

  factory NewOrderDetailsData.fromJson(Map<String, dynamic> json) => NewOrderDetailsData(
    id: json["id"],
    type: json["type"],
    reference: json["reference"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    total: json["total"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
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
    "vendor": vendor?.toJson(),
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Detail {
  final int? id;
  final int? productId;
  final int? orderId;
  final int? qty;
  final int? amount;
  final int? vat;
  final int? discount;
  final int? total;
  final int? shippingPrice;
  final String? shippingType;
  final String? region;
  final String? area;
  final String? addressDetails;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Product? product;

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
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
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
  final int? id;
  final int? vendorId;
  final List<String>? images;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final int? price;
  final int? discount;
  final String? type;
  final int? shopCatId;
  final String? shopSubCat;
  final int? stock;
  final Props? props;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
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
  final String? color;
  final String? size;
  final String? material;
  final String? condition;
  final String? warranty;
  final String? delivery;
  final String? freeShipping;
  final String? freeReturn;
  final String? freeInstallation;
  final String? freeExchange;
  final String? freeCancellation;
  final String? freeGift;
  final String? freeSupport;

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
