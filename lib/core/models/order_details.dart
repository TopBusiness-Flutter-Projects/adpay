import 'vendor_order_model.dart';

class MainDetailsModel {
  VendorOrderData? data;
  String? msg;
  int? status;

  MainDetailsModel({
    this.data,
    this.msg,
    this.status,
  });

  factory MainDetailsModel.fromJson(Map<String, dynamic> json) =>
      MainDetailsModel(
        data: json["data"] == null
            ? null
            : VendorOrderData.fromJson(json["data"]),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "status": status,
      };
}
