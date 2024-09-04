import 'Home_models.dart';

class AdsenceModel {
  final List<Ads>? data;
  final String? msg;
  final int? status;

  AdsenceModel({this.data, this.msg, this.status});

  factory AdsenceModel.fromJson(Map<String, dynamic> json) {
    return AdsenceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Ads.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] ,
      status: json['status'] ,
    );
  }
}
