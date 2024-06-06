import 'home_vendor_model.dart';

class MyWalletVendorModel {
  Data? data;
  String? msg;
  int? status;

  MyWalletVendorModel({
    this.data,
    this.msg,
    this.status,
  });

  factory MyWalletVendorModel.fromJson(Map<String, dynamic> json) =>
      MyWalletVendorModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
  int? balanceWallet;
  List<History>? history;
  Vendor? vendor;

  Data({
    this.balanceWallet,
    this.history,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balanceWallet: json["balance_wallet"],
        history: json["history"] == null
            ? []
            : List<History>.from(
                json["history"]!.map((x) => History.fromJson(x))),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
      );

  Map<String, dynamic> toJson() => {
        "balance_wallet": balanceWallet,
        "history": history == null
            ? []
            : List<dynamic>.from(history!.map((x) => x.toJson())),
        "vendor": vendor?.toJson(),
      };
}

class History {
  int? id;
  String? transactionId;
  int? amount;
  String? type;
  int? status;
  String? createdAt;

  History({
    this.id,
    this.transactionId,
    this.amount,
    this.type,
    this.status,
    this.createdAt,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        transactionId: json["transaction_id"],
        amount: json["amount"],
        type: json["type"],
        status: json["status"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_id": transactionId,
        "amount": amount,
        "type": type,
        "status": status,
        "created_at": createdAt,
      };
}
