class NotificationModel {
  List<NotificationDataModel>? data;
  String? msg;
  int? status;

  NotificationModel({
    this.data,
    this.msg,
    this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        data: json["data"] == null
            ? []
            : List<NotificationDataModel>.from(
                json["data"]!.map((x) => NotificationDataModel.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
      };
}

class NotificationDataModel {
  int? id;
  String? title;
  String? body;
  String? logo;
  int? userId;
  String? type;
  DateTime? createdAt;
  String? formattedCreatedAt;
  DateTime? updatedAt;

  NotificationDataModel({
    this.id,
    this.title,
    this.body,
    this.logo,
    this.userId,
    this.type,
    this.formattedCreatedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        logo: json["logo"],
        userId: json["user_id"],
        type: json["type"],
        formattedCreatedAt: json['formatted_created_at'],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "logo": logo,
        "formatted_created_at": formattedCreatedAt,
        "user_id": userId,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
