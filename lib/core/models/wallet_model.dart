class MyWalletModel {
  MyWalletModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  final Data data;
  final String msg;
  final int status;

  factory MyWalletModel.fromJson(Map<String, dynamic> json) => MyWalletModel(
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  Data({
    required this.wallet,
    required this.payments,
    required this.user,
  });

  final int wallet;
  final List<dynamic> payments;
  final User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallet: json["wallet"],
    payments: List<dynamic>.from(json["payments"].map((x) => x)),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet,
    "payments": List<dynamic>.from(payments.map((x) => x)),
    "user": user.toJson(),
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
    required this.session,
    required this.token,
  });

  final int id;
  final String name;
  final String image;
  final int phone;
  final String type;
  final int points;
  final String deviceToken;
  final String session;
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
