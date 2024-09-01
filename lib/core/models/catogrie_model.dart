class CategoriesModel {
  final List<Category>? data;
  final String? msg;
  final int? status;

  CategoriesModel({this.data, this.msg, this.status});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    dynamic jsonData = json['data'];
    List<Category>? categories;

    if (jsonData is List) {
      categories = jsonData.map((e) => Category.fromJson(e)).toList();
    } else if (jsonData is Map<String, dynamic>) {
      categories = [Category.fromJson(jsonData)];
    }

    return CategoriesModel(
      data: categories,
      msg: json['msg'],
      status: json['status'] ,
    );
  }
}

class Category {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  Category({
    this.id,
    this.titleAr,
    this.titleEn,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'] ,
      status: json['status'] ,
      createdAt: json['created_at'] ,
      updatedAt: json['updated_at'] ,
    );
  }
}
