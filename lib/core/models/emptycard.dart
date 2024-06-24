class CartEmptyResponse {
  final dynamic data; // Since data is null, we can use dynamic
  final String msg;
  final int status;

  CartEmptyResponse({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory CartEmptyResponse.fromJson(Map<String, dynamic> json) {
    return CartEmptyResponse(
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
