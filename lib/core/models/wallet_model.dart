class MyWalletModel {
  MyWalletModel({
     this.data,
     this.msg,
     this.status,
  });

   Data? data;
   String? msg;
   String? status;

  factory MyWalletModel.fromJson(Map<String, dynamic> json) => MyWalletModel(
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "msg": msg,
    "status": status,
  };
}

class Data {
  Data({
     this.wallet,
     this.payments,
     this.user,
  });

  final String? wallet;
  final List<dynamic>? payments;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallet: json["wallet"],
    payments: List<dynamic>.from(json["payments"].map((x) => x)),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "wallet": wallet,
    "payments": List<dynamic>.from(payments!.map((x) => x)),
    "user": user!.toJson(),
  };
}

class User {
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

   int? id;
   String? name;
   String? image;
   String? phone;
   String? type;
   String? points;
   String? deviceToken;
   String? session;
   String? token;

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
