class ProductModel {
  List<Data> data;

  ProductModel({
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class Data {
  int id;
  List<String> images;
  String titleAr;
  String titleEn;
  String descriptionAr;
  String descriptionEn;
  int price;
  int discount;
  String type;
  String shopSubCat;
  int stock;
  Props props;
  Vendor vendor;

  Data({
    required this.id,
    required this.images,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.discount,
    required this.type,
    required this.shopSubCat,
    required this.stock,
    required this.props,
    required this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      price: json['price'] ?? 0,
      discount: json['discount'] ?? 0,
      type: json['type'] ?? '',
      shopSubCat: json['shop_sub_cat'] ?? '',
      stock: json['stock'] ?? 0,
      props: Props.fromJson(json['props'] ?? {}),
      vendor: Vendor.fromJson(json['vendor'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
      'title_ar': titleAr,
      'title_en': titleEn,
      'description_ar': descriptionAr,
      'description_en': descriptionEn,
      'price': price,
      'discount': discount,
      'type': type,
      'shop_sub_cat': shopSubCat,
      'stock': stock,
      'props': props.toJson(),
      'vendor': vendor.toJson(),
    };
  }
}

class Props {
  String color;
  String size;
  String material;
  String condition;
  String warranty;
  String delivery;
  String freeShipping;
  String freeReturn;
  String freeInstallation;
  String freeExchange;
  String freeCancellation;
  String freeGift;
  String freeSupport;

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

  factory Props.fromJson(Map<String, dynamic> json) {
    return Props(
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      material: json['material'] ?? '',
      condition: json['condition'] ?? '',
      warranty: json['warranty'] ?? '',
      delivery: json['delivery'] ?? '',
      freeShipping: json['free_shipping'] ?? '',
      freeReturn: json['free_return'] ?? '',
      freeInstallation: json['free_installation'] ?? '',
      freeExchange: json['free_exchange'] ?? '',
      freeCancellation: json['free_cancellation'] ?? '',
      freeGift: json['free_gift'] ?? '',
      freeSupport: json['free_support'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'size': size,
      'material': material,
      'condition': condition,
      'warranty': warranty,
      'delivery': delivery,
      'free_shipping': freeShipping,
      'free_return': freeReturn,
      'free_installation': freeInstallation,
      'free_exchange': freeExchange,
      'free_cancellation': freeCancellation,
      'free_gift': freeGift,
      'free_support': freeSupport,
    };
  }
}

class Vendor {
  int id;
  String name;
  String image;
  int phone;
  String type;
  String deviceToken;
  dynamic session;
  String logo;
  String banner;
  String titleAr;
  String titleEn;
  ShopCat shopCat;
  List<String> shopSubCat;
  String token;

  Vendor({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.type,
    required this.deviceToken,
    required this.session,
    required this.logo,
    required this.banner,
    required this.titleAr,
    required this.titleEn,
    required this.shopCat,
    required this.shopSubCat,
    required this.token,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      phone: json['phone'] ?? 0,
      type: json['type'] ?? '',
      deviceToken: json['device_token'] ?? '',
      session: json['session'],
      logo: json['logo'] ?? '',
      banner: json['banner'] ?? '',
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      shopCat: ShopCat.fromJson(json['shop_cat'] ?? {}),
      shopSubCat: List<String>.from(json['shop_sub_cat'] ?? []),
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'phone': phone,
      'type': type,
      'device_token': deviceToken,
      'session': session,
      'logo': logo,
      'banner': banner,
      'title_ar': titleAr,
      'title_en': titleEn,
      'shop_cat': shopCat.toJson(),
      'shop_sub_cat': shopSubCat,
      'token': token,
    };
  }
}

class ShopCat {
  int id;
  String name;
  String image;
  String description;

  ShopCat({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory ShopCat.fromJson(Map<String, dynamic> json) {
    return ShopCat(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
    };
  }
}
