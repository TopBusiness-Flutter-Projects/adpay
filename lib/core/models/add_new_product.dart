class AddNewProductModel {
  Data? data;
  String? msg;
  int? status;

  AddNewProductModel({
    this.data,
    this.msg,
    this.status,
  });

  factory AddNewProductModel.fromJson(Map<String, dynamic> json) =>
      AddNewProductModel(
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
  int? id;
  List<String>? images;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  String? price;
  bool? isFav;
  int? rate;
  String? discount;
  String? type;
  String? shopSubCat;
  String? stock;
  Vendor? vendor;

  Data({
    this.id,
    this.images,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.price,
    this.isFav,
    this.rate,
    this.discount,
    this.type,
    this.shopSubCat,
    this.stock,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        price: json["price"],
        isFav: json["is_fav"],
        rate: json["rate"],
        discount: json["discount"],
        type: json["type"],
        shopSubCat: json["shop_sub_cat"],
        stock: json["stock"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "title_ar": titleAr,
        "title_en": titleEn,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "price": price,
        "is_fav": isFav,
        "rate": rate,
        "discount": discount,
        "type": type,
        "shop_sub_cat": shopSubCat,
        "stock": stock,
        "vendor": vendor?.toJson(),
      };
}

class Vendor {
  int? id;
  String? name;
  String? image;
  int? phone;
  String? type;
  String? deviceToken;
  dynamic session;
  String? logo;
  String? banner;
  String? storeName;
  String? address;
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
    this.storeName,
    this.address,
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
        storeName: json["store_name"],
        address: json["address"],
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
        "store_name": storeName,
        "address": address,
        "shop_cat": shopCat?.toJson(),
        "shop_sub_cat": shopSubCat == null
            ? []
            : List<dynamic>.from(shopSubCat!.map((x) => x)),
        "token": token,
      };
}

class ShopCat {
  int? id;
  String? titleAr;
  String? titleEn;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ShopCat({
    this.id,
    this.titleAr,
    this.titleEn,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ShopCat.fromJson(Map<String, dynamic> json) => ShopCat(
        id: json["id"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
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
        "title_ar": titleAr,
        "title_en": titleEn,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
