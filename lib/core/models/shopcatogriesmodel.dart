class GetShopCategoriesModel {
  final List<Category> data;
  final String msg;
  final int status;

  GetShopCategoriesModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory GetShopCategoriesModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data']==null?[]: json['data'] as List<dynamic>;
    List<Category> categoriesList = dataList.map((item) => Category.fromJson(item as Map<String, dynamic>)).toList();
    // var dataList = json['data'] as List<dynamic>;
    // List<Category> categoriesList = dataList
    //     .map((item) => Category.fromJson(item as Map<String, dynamic>))
    //     .toList();

    return GetShopCategoriesModel(
      data: categoriesList,
      msg: json['msg'] as String,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
      'msg': msg,
      'status': status,
    };
  }
}

class Category {
  final int? id;
  final String? titleAr;
  final String? titleEn;
  final String? status;

  Category({
    this.id,
    this.titleAr,
    this.titleEn,
    this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      titleAr: json['title_ar'] ,
      titleEn: json['title_en'] ,
      status: json['status'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_ar': titleAr,
      'title_en': titleEn,
      'status': status,
    };
  }
}
