
class ProductDetailsModel {
  Product? data;
  String? msg;
  int? status;

  ProductDetailsModel({
    this.data,
    this.msg,
    this.status,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        data: json["data"] == null ? null : Product.fromJson(json["data"]),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "status": status,
      };
}

class Product {
  Product({
    required this.id,
    required this.images,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.isFav,
    required this.rate,
    required this.discount,
    required this.type,
    required this.shopSubCat,
    required this.stock,
    required this.props,
    required this.vendor,
  });
  late final int id;
  late final List<String> images;
  late final String titleAr;
  late final String titleEn;
  late final String descriptionAr;
  late final String descriptionEn;
  late final int price;
  late bool isFav;
  late final int rate;
  late final int discount;
  late final String type;
  late final String shopSubCat;
  late final int stock;
  late final Props props;
  late final Vendor vendor;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = List.castFrom<dynamic, String>(json['images']);
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    price = json['price'];
    isFav = json['is_fav'];
    rate = json['rate'];
    discount = json['discount'];
    type = json['type'];
    shopSubCat = json['shop_sub_cat'];
    stock = json['stock'];
    props = Props.fromJson(json['props']);
    vendor = Vendor.fromJson(json['vendor']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['images'] = images;
    _data['title_ar'] = titleAr;
    _data['title_en'] = titleEn;
    _data['description_ar'] = descriptionAr;
    _data['description_en'] = descriptionEn;
    _data['price'] = price;
    _data['is_fav'] = isFav;
    _data['rate'] = rate;
    _data['discount'] = discount;
    _data['type'] = type;
    _data['shop_sub_cat'] = shopSubCat;
    _data['stock'] = stock;
    _data['props'] = props.toJson();
    _data['vendor'] = vendor.toJson();
    return _data;
  }
}

class Props {
  Props({
    required this.color,
    required this.size,
    required this.material,
    required this.condition,
    required this.warranty,
    required this.delivery,
    required this.freeShipping,
    required this.freeReturn,
    required this.freeInstallation,
    required this.freeExchange,
    required this.freeCancellation,
    required this.freeGift,
    required this.freeSupport,
  });
  late final String color;
  late final String size;
  late final String material;
  late final String condition;
  late final String warranty;
  late final String delivery;
  late final String freeShipping;
  late final String freeReturn;
  late final String freeInstallation;
  late final String freeExchange;
  late final String freeCancellation;
  late final String freeGift;
  late final String freeSupport;

  Props.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    size = json['size'];
    material = json['material'];
    condition = json['condition'];
    warranty = json['warranty'];
    delivery = json['delivery'];
    freeShipping = json['free_shipping'];
    freeReturn = json['free_return'];
    freeInstallation = json['free_installation'];
    freeExchange = json['free_exchange'];
    freeCancellation = json['free_cancellation'];
    freeGift = json['free_gift'];
    freeSupport = json['free_support'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['color'] = color;
    _data['size'] = size;
    _data['material'] = material;
    _data['condition'] = condition;
    _data['warranty'] = warranty;
    _data['delivery'] = delivery;
    _data['free_shipping'] = freeShipping;
    _data['free_return'] = freeReturn;
    _data['free_installation'] = freeInstallation;
    _data['free_exchange'] = freeExchange;
    _data['free_cancellation'] = freeCancellation;
    _data['free_gift'] = freeGift;
    _data['free_support'] = freeSupport;
    return _data;
  }
}

class Vendor {
  Vendor({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.type,
    required this.deviceToken,
    this.session,
    required this.logo,
    required this.banner,
    required this.titleAr,
    required this.titleEn,
    required this.shopCat,
    required this.shopSubCat,
    required this.token,
  });
  late final int id;
  late final String name;
  late final String image;
  late final int phone;
  late final String type;
  late final String deviceToken;
  late final Null session;
  late final String logo;
  late final String banner;
  late final String titleAr;
  late final String titleEn;
  late final ShopCat shopCat;
  late final List<String> shopSubCat;
  late final String token;

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    type = json['type'];
    deviceToken = json['device_token'];
    session = null;
    logo = json['logo'];
    banner = json['banner'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    shopCat = ShopCat.fromJson(json['shop_cat']);
    shopSubCat = List.castFrom<dynamic, String>(json['shop_sub_cat']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['phone'] = phone;
    _data['type'] = type;
    _data['device_token'] = deviceToken;
    _data['session'] = session;
    _data['logo'] = logo;
    _data['banner'] = banner;
    _data['title_ar'] = titleAr;
    _data['title_en'] = titleEn;
    _data['shop_cat'] = shopCat.toJson();
    _data['shop_sub_cat'] = shopSubCat;
    _data['token'] = token;
    return _data;
  }
}

class ShopCat {
  ShopCat({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String titleAr;
  late final String titleEn;
  late final int status;
  late final String createdAt;
  late final String updatedAt;

  ShopCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title_ar'] = titleAr;
    _data['title_en'] = titleEn;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
