class GrageModel {
  final List<Data> data;
  final String msg;
  final int status;

  GrageModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory GrageModel.fromJson(Map<String, dynamic> json) {
    // Assuming 'data' is a map, not a list
    final List<dynamic> dataList = json['data'] ?? [];
    return GrageModel(
      data: dataList.map((x) => Data.fromJson(x)).toList(),
      msg: json['msg'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class Data {
  final int id;
  final String images;
  final int price;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String descriptionEn;
  final dynamic isSold;
  final dynamic userId;
  final dynamic video;
  final dynamic catId;
  final dynamic subCatId;
  final String createdAt;
  final String updatedAt;

  Data({
    required this.id,
    required this.images,
    required this.price,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.isSold,
    required this.userId,
    required this.video,
    required this.catId,
    required this.subCatId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      images: json['images'],
      price: json['price'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      isSold: json['is_sold'],
      userId: json['user_id'],
      video: json['video'],
      catId: json['cat_id'],
      subCatId: json['sub_cat_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
