class GetRegionsModel {
  final List<Region>? data;
  final String? msg;
  final int? status;

  GetRegionsModel({this.data, this.msg, this.status});

  factory GetRegionsModel.fromJson(Map<String, dynamic> json) {
    return GetRegionsModel(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => Region.fromJson(i)).toList()
          : null,
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'msg': msg,
      'status': status,
    };
  }
}

class Region {
  final int? regionId;
  final int? capitalCityId;
  final String? code;
  final String? nameAr;
  final String? nameEn;
  final int? population;

  Region({
    this.regionId,
    this.capitalCityId,
    this.code,
    this.nameAr,
    this.nameEn,
    this.population,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      regionId: json['region_id'] as int?,
      capitalCityId: json['capital_city_id'] as int?,
      code: json['code'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      population: json['population'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'region_id': regionId,
      'capital_city_id': capitalCityId,
      'code': code,
      'name_ar': nameAr,
      'name_en': nameEn,
      'population': population,
    };
  }
}
