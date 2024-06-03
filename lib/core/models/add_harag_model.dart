class AddHaragModel {
  AddHaragModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  final Data data;
  final String msg;
  final int status;

  factory AddHaragModel.fromJson(Map<String, dynamic> json) => AddHaragModel(
    data: json["data"] != null ? Data.fromJson(json["data"]) : Data.empty(),
    msg: json["msg"] ?? '',
    status: json["status"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  Data({
    required this.images,
    required this.titleAr,
    required this.descriptionAr,
    required this.userId,
    required this.price,
    required this.catId,
    required this.subCatId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String images;
  final String titleAr;
  final String descriptionAr;
  final String userId;
  final String price;
  final String catId;
  final String subCatId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    images: json["images"] ?? '',
    titleAr: json["title_ar"] ?? '',
    descriptionAr: json["description_ar"] ?? '',
    userId: json["user_id"] ?? '',
    price: json["price"] ?? '',
    catId: json["cat_id"] ?? '',
    subCatId: json["sub_cat_id"] ?? '',
    updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
    createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
    id: json["id"] ?? 0,
  );

  factory Data.empty() => Data(
    images: '',
    titleAr: '',
    descriptionAr: '',
    userId: '',
    price: '',
    catId: '',
    subCatId: '',
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    id: 0,
  );

  Map<String, dynamic> toJson() => {
    "images": images,
    "title_ar": titleAr,
    "description_ar": descriptionAr,
    "user_id": userId,
    "price": price,
    "cat_id": catId,
    "sub_cat_id": subCatId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
