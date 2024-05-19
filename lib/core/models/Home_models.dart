
class HomeModel {
  Data? data;
  String? msg;
  int? status;

  HomeModel({this.data, this.msg, this.status});

  HomeModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    msg = json["msg"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["msg"] = msg;
    _data["status"] = status;
    return _data;
  }
}

class Data {
  List<Sliders>? sliders;
  List<Categories>? categories;
  List<Ads>? ads;
  List<Products>? productMostSell;
  List<Shops>? shops;
  List<Auctions>? auctions;
  List<Products>? products;
  User? user;

  Data({this.sliders, this.categories, this.ads, this.productMostSell, this.shops, this.auctions, this.products, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    sliders = json["sliders"] == null ? null : (json["sliders"] as List).map((e) => Sliders.fromJson(e)).toList();
    categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
    ads = json["ads"] == null ? null : (json["ads"] as List).map((e) => Ads.fromJson(e)).toList();
    productMostSell = json["product_most_sell"] == null ? null : (json["product_most_sell"] as List).map((e) => Products.fromJson(e)).toList();;
    shops = json["shops"] == null ? null : (json["shops"] as List).map((e) => Shops.fromJson(e)).toList();
    auctions = json["auctions"] == null ? null : (json["auctions"] as List).map((e) => Auctions.fromJson(e)).toList();
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(sliders != null) {
      _data["sliders"] = sliders?.map((e) => e.toJson()).toList();
    }
    if(categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
    }
    if(ads != null) {
      _data["ads"] = ads?.map((e) => e.toJson()).toList();
    }
    if(productMostSell != null) {
      _data["product_most_sell"] = productMostSell;
    }
    if(shops != null) {
      _data["shops"] = shops?.map((e) => e.toJson()).toList();
    }
    if(auctions != null) {
      _data["auctions"] = auctions?.map((e) => e.toJson()).toList();
    }
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? image;
  int? phone;
  String? password;
  int? verifiedAt;
  int? points;
  String? type;
  String? deviceToken;
  int? status;
  String? session;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.image, this.phone, this.password, this.verifiedAt, this.points, this.type, this.deviceToken, this.status, this.session, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    phone = json["phone"];
    password = json["password"];
    verifiedAt = json["verified_at"];
    points = json["points"];
    type = json["type"];
    deviceToken = json["device_token"];
    status = json["status"];
    session = json["session"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["phone"] = phone;
    _data["password"] = password;
    _data["verified_at"] = verifiedAt;
    _data["points"] = points;
    _data["type"] = type;
    _data["device_token"] = deviceToken;
    _data["status"] = status;
    _data["session"] = session;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Products {
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
  String? createdAt;
  String? updatedAt;

  Products({this.id, this.vendorId, this.images, this.titleAr, this.titleEn, this.descriptionAr, this.descriptionEn, this.price, this.discount, this.type, this.shopCatId, this.shopSubCat, this.stock, this.props, this.status, this.createdAt, this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    vendorId = json["vendor_id"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    descriptionAr = json["description_ar"];
    descriptionEn = json["description_en"];
    price = json["price"];
    discount = json["discount"];
    type = json["type"];
    shopCatId = json["shop_cat_id"];
    shopSubCat = json["shop_sub_cat"];
    stock = json["stock"];
    props = json["props"] == null ? null : Props.fromJson(json["props"]);
    status = json["status"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["vendor_id"] = vendorId;
    if(images != null) {
      _data["images"] = images;
    }
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["price"] = price;
    _data["discount"] = discount;
    _data["type"] = type;
    _data["shop_cat_id"] = shopCatId;
    _data["shop_sub_cat"] = shopSubCat;
    _data["stock"] = stock;
    if(props != null) {
      _data["props"] = props?.toJson();
    }
    _data["status"] = status;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
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

  Props({this.color, this.size, this.material, this.condition, this.warranty, this.delivery, this.freeShipping, this.freeReturn, this.freeInstallation, this.freeExchange, this.freeCancellation, this.freeGift, this.freeSupport});

  Props.fromJson(Map<String, dynamic> json) {
    color = json["color"];
    size = json["size"];
    material = json["material"];
    condition = json["condition"];
    warranty = json["warranty"];
    delivery = json["delivery"];
    freeShipping = json["free_shipping"];
    freeReturn = json["free_return"];
    freeInstallation = json["free_installation"];
    freeExchange = json["free_exchange"];
    freeCancellation = json["free_cancellation"];
    freeGift = json["free_gift"];
    freeSupport = json["free_support"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["color"] = color;
    _data["size"] = size;
    _data["material"] = material;
    _data["condition"] = condition;
    _data["warranty"] = warranty;
    _data["delivery"] = delivery;
    _data["free_shipping"] = freeShipping;
    _data["free_return"] = freeReturn;
    _data["free_installation"] = freeInstallation;
    _data["free_exchange"] = freeExchange;
    _data["free_cancellation"] = freeCancellation;
    _data["free_gift"] = freeGift;
    _data["free_support"] = freeSupport;
    return _data;
  }
}

class Auctions {
  int? id;
  String? images;
  int? price;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  int? isSold;
  int? userId;
  dynamic video;
  int? catId;
  int? subCatId;
  String? createdAt;
  String? updatedAt;

  Auctions({this.id, this.images, this.price, this.titleAr, this.titleEn, this.descriptionAr, this.descriptionEn, this.isSold, this.userId, this.video, this.catId, this.subCatId, this.createdAt, this.updatedAt});

  Auctions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    images = json["images"];
    price = json["price"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    descriptionAr = json["description_ar"];
    descriptionEn = json["description_en"];
    isSold = json["is_sold"];
    userId = json["user_id"];
    video = json["video"];
    catId = json["cat_id"];
    subCatId = json["sub_cat_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["images"] = images;
    _data["price"] = price;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["is_sold"] = isSold;
    _data["user_id"] = userId;
    _data["video"] = video;
    _data["cat_id"] = catId;
    _data["sub_cat_id"] = subCatId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Shops {
  int? id;
  String? logo;
  String? banner;
  String? titleAr;
  String? titleEn;
  int? shopCatId;
  List<String>? shopSubCat;
  int? vendorId;
  String? createdAt;
  String? updatedAt;

  Shops({this.id, this.logo, this.banner, this.titleAr, this.titleEn, this.shopCatId, this.shopSubCat, this.vendorId, this.createdAt, this.updatedAt});

  Shops.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    logo = json["logo"];
    banner = json["banner"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    shopCatId = json["shop_cat_id"];
    shopSubCat = json["shop_sub_cat"] == null ? null : List<String>.from(json["shop_sub_cat"]);
    vendorId = json["vendor_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["logo"] = logo;
    _data["banner"] = banner;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["shop_cat_id"] = shopCatId;
    if(shopSubCat != null) {
      _data["shop_sub_cat"] = shopSubCat;
    }
    _data["vendor_id"] = vendorId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Ads {
  int? id;
  String? image;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  int? userId;
  int? status;
  int? paymentStatus;
  int? countViews;
  int? packageId;
  int? views;
  int? complete;
  dynamic video;
  String? createdAt;
  String? updatedAt;

  Ads({this.id, this.image, this.titleAr, this.titleEn, this.descriptionAr, this.descriptionEn, this.userId, this.status, this.paymentStatus, this.countViews, this.packageId, this.views, this.complete, this.video, this.createdAt, this.updatedAt});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
    descriptionAr = json["description_ar"];
    descriptionEn = json["description_en"];
    userId = json["user_id"];
    status = json["status"];
    paymentStatus = json["payment_status"];
    countViews = json["count_views"];
    packageId = json["package_id"];
    views = json["views"];
    complete = json["complete"];
    video = json["video"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    _data["description_ar"] = descriptionAr;
    _data["description_en"] = descriptionEn;
    _data["user_id"] = userId;
    _data["status"] = status;
    _data["payment_status"] = paymentStatus;
    _data["count_views"] = countViews;
    _data["package_id"] = packageId;
    _data["views"] = views;
    _data["complete"] = complete;
    _data["video"] = video;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Categories {
  int? id;
  String? titleAr;
  String? titleEn;

  Categories({this.id, this.titleAr, this.titleEn});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    titleAr = json["title_ar"];
    titleEn = json["title_en"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title_ar"] = titleAr;
    _data["title_en"] = titleEn;
    return _data;
  }
}

class Sliders {
  int? id;
  String? image;
  dynamic url;

  Sliders({this.id, this.image, this.url});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["image"] = image;
    _data["url"] = url;
    return _data;
  }
}