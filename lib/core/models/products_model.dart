import 'Home_models.dart';

class ProductModel {
  ProductModel({
    this.data,
    this.msg,
    this.status,
  });
    List<Products>? data;
    String? msg;
    int? status;

  ProductModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Products.fromJson(e)).toList();
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['msg'] = msg;
    _data['status'] = status;
    return _data;
  }
}
