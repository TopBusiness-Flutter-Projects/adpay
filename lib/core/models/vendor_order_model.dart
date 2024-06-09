import 'home_vendor_model.dart';

class VendorOrdersModel {
  List<VendorOrderData>? data;
  String? msg;
  int? status;

  VendorOrdersModel({
    this.data,
    this.msg,
    this.status,
  });

  factory VendorOrdersModel.fromJson(Map<String, dynamic> json) =>
      VendorOrdersModel(
        data: json["data"] == null
            ? []
            : List<VendorOrderData>.from(
                json["data"]!.map((x) => VendorOrderData.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
      };
}

class VendorOrderData {
  int? id;
  String? type;
  String? reference;
  DateTime? date;
  dynamic total;
  int? userId;
  int? vendorId;
  DateTime? createdAt;
  dynamic updatedAt;
  Vendor? vendor;

  List<DetailOfVendorOrder>? details;

  VendorOrderData(
      {this.id,
      this.type,
      this.reference,
      this.date,
      this.total,
      this.userId,
      this.vendorId,
      this.vendor,
      this.createdAt,
      this.updatedAt,
      this.details});

  factory VendorOrderData.fromJson(Map<String, dynamic> json) =>
      VendorOrderData(
        id: json["id"],
        type: json["type"],
        reference: json["reference"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        total: json["total"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        userId: json["user_id"],
        vendorId: json["vendor_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        details: json["details"] == null
            ? []
            : List<DetailOfVendorOrder>.from(
                json["details"]!.map((x) => DetailOfVendorOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "reference": reference,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total": total,
        "user_id": userId,
        "vendor": vendor?.toJson(),
        "vendor_id": vendorId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

//!

class DetailOfVendorOrder {
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
  Product? product;

  DetailOfVendorOrder({
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

  factory DetailOfVendorOrder.fromJson(Map<String, dynamic> json) =>
      DetailOfVendorOrder(
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
  int? vendorId;
  List<String>? images;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  int? price;
  int? discount;
  String? type;
  int? shopCatId;
  String? shopSubCat;
  int? stock;
  Props? props;
  int? status;
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
  int? phone;
  String? type;
  String? deviceToken;
  String? session;
  String? logo;
  String? banner;
  String? titleAr;
  String? titleEn;
  ShopCat? shopCat;
  List<String>? shopSubCat;
  String? token;

  Vendor({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.type,
    this.deviceToken,
    this.session,
    this.logo,
    this.banner,
    this.titleAr,
    this.titleEn,
    this.shopCat,
    this.shopSubCat,
    this.token,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        phone: json["phone"],
        type: json["type"],
        deviceToken: json["device_token"],
        session: json["session"],
        logo: json["logo"],
        banner: json["banner"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        shopCat: json["shop_cat"] == null
            ? null
            : ShopCat.fromJson(json["shop_cat"]),
        shopSubCat: json["shop_sub_cat"] == null
            ? []
            : List<String>.from(json["shop_sub_cat"]!.map((x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "phone": phone,
        "type": type,
        "device_token": deviceToken,
        "session": session,
        "logo": logo,
        "banner": banner,
        "title_ar": titleAr,
        "title_en": titleEn,
        "shop_cat": shopCat?.toJson(),
        "shop_sub_cat": shopSubCat == null
            ? []
            : List<dynamic>.from(shopSubCat!.map((x) => x)),
        "token": token,
      };
}

