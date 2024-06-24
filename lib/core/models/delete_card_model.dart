class DeleteCardModel {
  final dynamic data; // Since data is null, we can use dynamic
  final String msg;
  final int status;

  DeleteCardModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory DeleteCardModel.fromJson(Map<String, dynamic> json) {
    return DeleteCardModel(
      data: json['data'],
      msg: json['msg'] ?? '',
      status: json['status'] ?? 0,
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
