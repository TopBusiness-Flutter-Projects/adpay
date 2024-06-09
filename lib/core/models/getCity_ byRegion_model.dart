// To parse this JSON data, do
//
//     final getCityByRegionModel = getCityByRegionModelFromJson(jsonString);

class GetCityByRegionModel {
  List<Datum>? data;
  String? msg;
  int? status;

  GetCityByRegionModel({
    this.data,
    this.msg,
    this.status,
  });

  factory GetCityByRegionModel.fromJson(Map<String, dynamic> json) => GetCityByRegionModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg,
    "status": status,
  };
}

class Datum {
  int? cityId;
  int? regionId;
  String? nameAr;
  String? nameEn;

  Datum({
    this.cityId,
    this.regionId,
    this.nameAr,
    this.nameEn,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    cityId: json["city_id"],
    regionId: json["region_id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "region_id": regionId,
    "name_ar": nameAr,
    "name_en": nameEn,
  };
}
