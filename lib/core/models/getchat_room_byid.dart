
class GetChatRoomById {
  GetChatRoomById({
    required this.data,
    required this.msg,
    required this.status,
  });

  final ChatRoomData data;
  final String msg;
  final int status;

  factory GetChatRoomById.fromJson(Map<String, dynamic> json) => GetChatRoomById(
    data: ChatRoomData.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "msg": msg,
    "status": status,
  };
}

class ChatRoomData {
  ChatRoomData({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
  });

  final int id;
  final User fromUserId;
  final User toUserId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Message> messages;

  factory ChatRoomData.fromJson(Map<String, dynamic> json) => ChatRoomData(
    id: json["id"],
    fromUserId: User.fromJson(json["from_user_id"]),
    toUserId: User.fromJson(json["to_user_id"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from_user_id": fromUserId.toJson(),
    "to_user_id": toUserId.toJson(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.type,
    required this.points,
    required this.deviceToken,
    this.session,
    required this.token,
  });

  final int id;
  final String name;
  final String image;
  final int phone;
  final String type;
  final int points;
  final String deviceToken;
  final String? session;
  final String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    phone: json["phone"],
    type: json["type"],
    points: json["points"],
    deviceToken: json["device_token"],
    session: json["session"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "phone": phone,
    "type": type,
    "points": points,
    "device_token": deviceToken,
    "session": session,
    "token": token,
  };
}

class Message {
  Message({
    required this.id,
    required this.roomId,
    required this.fromUserId,
    required this.toUserId,
    required this.message,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int roomId;
  final int fromUserId;
  final int toUserId;
  final String message;
  final int seen;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    roomId: json["room_id"],
    fromUserId: json["from_user_id"],
    toUserId: json["to_user_id"],
    message: json["message"],
    seen: json["seen"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "room_id": roomId,
    "from_user_id": fromUserId,
    "to_user_id": toUserId,
    "message": message,
    "seen": seen,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

