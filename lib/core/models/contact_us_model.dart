class ContactUsModel {
  ContactUsModel({
    this.data,
    required this.msg,
    required this.status,
  });

  final Data? data;
  final String msg;
  final int status;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "msg": msg,
        "status": status,
      };
}

class Data {
  Data({
    required this.subject,
    required this.message,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String subject;
  final String message;
  final dynamic userId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subject: json["subject"],
        message: json["message"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "message": message,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
