class ConfirmOrderModel {
  final dynamic data; // Since data is null, we can use dynamic
  final String msg;
  final int status;

  ConfirmOrderModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory ConfirmOrderModel.fromJson(Map<String, dynamic> json) {
    return ConfirmOrderModel(
      data: json['data'],
      msg: json['msg'] ?? '',
      status: json['status'] ?? 0,
    );
  }
  //

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'msg': msg,
      'status': status,
    };
  }
}
