class SubCatogreyModel {
  final List<SubCategory> data;
  final String msg;
  final int status;

  SubCatogreyModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory SubCatogreyModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<SubCategory> subCategoriesList =
    dataList.map((item) => SubCategory.fromJson(item)).toList();

    return SubCatogreyModel(
      data: subCategoriesList,
      msg: json['msg'] as String,
      status: json['status'] as int,
    );
  }
}

class SubCategory {
   int ?id;
   String? titleAr;
   String? titleEn;

  SubCategory({
     this.id,
     this.titleAr,
     this.titleEn,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] as int,
      titleAr: json['title_ar'] as String,
      titleEn: json['title_en'] as String,
    );
  }
}
