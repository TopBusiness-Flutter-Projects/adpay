class SendMessageModel {
  Data? data;
  String? msg;
  int? status;

  SendMessageModel({this.data, this.msg, this.status});

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  User? fromUserId;
  User? toUserId;
  String? createdAt;
  String? updatedAt;
  List<Message>? messages;

  Data({
    this.id,
    this.fromUserId,
    this.toUserId,
    this.createdAt,
    this.updatedAt,
    this.messages,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      fromUserId: json['from_user_id'] != null
          ? User.fromJson(json['from_user_id'])
          : null,
      toUserId: json['to_user_id'] != null
          ? User.fromJson(json['to_user_id'])
          : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      messages: json['messages'] != null
          ? (json['messages'] as List)
          .map((i) => Message.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    if (this.fromUserId != null) {
      data['from_user_id'] = this.fromUserId!.toJson();
    }
    if (this.toUserId != null) {
      data['to_user_id'] = this.toUserId!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? image;
  int? phone;
  String? type;
  int? points;
  String? deviceToken;
  String? session;
  String? token;

  User({
    this.id,
    this.name,
    this.image,
    this.phone,
    this.type,
    this.points,
    this.deviceToken,
    this.session,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      phone: json['phone'],
      type: json['type'],
      points: json['points'],
      deviceToken: json['device_token'],
      session: json['session'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['points'] = this.points;
    data['device_token'] = this.deviceToken;
    data['session'] = this.session;
    data['token'] = this.token;
    return data;
  }
}

class Message {
  int? id;
  int? roomId;
  int? fromUserId;
  int? toUserId;
  String? message;
  int? seen;
  String? createdAt;
  String? updatedAt;

  Message({
    this.id,
    this.roomId,
    this.fromUserId,
    this.toUserId,
    this.message,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      roomId: json['room_id'],
      fromUserId: json['from_user_id'],
      toUserId: json['to_user_id'],
      message: json['message'],
      seen: json['seen'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['from_user_id'] = this.fromUserId;
    data['to_user_id'] = this.toUserId;
    data['message'] = this.message;
    data['seen'] = this.seen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
