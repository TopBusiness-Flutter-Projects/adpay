class MyCoinsModel {
  MyCoinsModel({
    this.data,
    required this.msg,
    required this.status,
  });

  final Data? data;
  final String msg;
  final int status;

  factory MyCoinsModel.fromJson(Map<String, dynamic> json) => MyCoinsModel(
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
    required this.user,
    required this.ads,
    required this.configPoint,
  });

  final User user;
  final List<dynamic> ads;
  final dynamic configPoint;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    ads: List<dynamic>.from(json["ads"].map((x) => x)),
    configPoint: json["config_point"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "ads": List<dynamic>.from(ads.map((x) => x)),
    "config_point": configPoint,
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
