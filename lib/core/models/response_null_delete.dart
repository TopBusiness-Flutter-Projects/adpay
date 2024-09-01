class ResponseNullModel {
  dynamic data;
  String? msg;
  dynamic? status;

  ResponseNullModel({
    this.data,
    this.msg,
    this.status,
  });

  factory ResponseNullModel.fromJson(Map<String, dynamic> json) =>
      ResponseNullModel(
        data: json["data"],
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "msg": msg,
        "status": status,
      };
}
