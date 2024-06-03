class LogoutModel {
  LogoutModel({
    this.data,
    required this.msg,
    required this.status,
  });

  final dynamic data;
  final String msg;
  final int status;

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
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
