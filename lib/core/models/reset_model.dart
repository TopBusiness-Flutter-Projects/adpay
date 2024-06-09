class ResetPassModel {
  final dynamic data; // Keeping it dynamic since it can be null or any type
  final String msg;
  final int status;

  ResetPassModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory ResetPassModel.fromJson(Map<String, dynamic> json) {
    return ResetPassModel(
      data: json['data'],
      msg: json['msg'] as String,
      status: json['status'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'msg': msg,
      'status': status,
    };
  }
}
