class ShopCategoryVendorModel {
  List<ShopCategoryVendorModelData>? data;
  String? msg;
  int? status;

  ShopCategoryVendorModel({
    this.data,
    this.msg,
    this.status,
  });

  factory ShopCategoryVendorModel.fromJson(Map<String, dynamic> json) =>
      ShopCategoryVendorModel(
        data: json["data"] == null
            ? []
            : List<ShopCategoryVendorModelData>.from(json["data"]!
                .map((x) => ShopCategoryVendorModelData.fromJson(x))),
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

class ShopCategoryVendorModelData {
  int? id;
  String? titleAr;
  String? titleEn;
  int? status;

  ShopCategoryVendorModelData({
    this.id,
    this.titleAr,
    this.titleEn,
    this.status,
  });

  factory ShopCategoryVendorModelData.fromJson(Map<String, dynamic> json) =>
      ShopCategoryVendorModelData(
        id: json["id"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_ar": titleAr,
        "title_en": titleEn,
        "status": status,
      };
}
