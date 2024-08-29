
class GetAdPackagesModel {
    List<GetAdPackagesModelData>? data;
    String? msg;
    int? status;

    GetAdPackagesModel({
        this.data,
        this.msg,
        this.status,
    });

    factory GetAdPackagesModel.fromJson(Map<String, dynamic> json) => GetAdPackagesModel(
        data: json["data"] == null ? [] : List<GetAdPackagesModelData>.from(json["data"]!.map((x) => GetAdPackagesModelData.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class GetAdPackagesModelData {
    dynamic? id;
    dynamic? count;
    dynamic? price;

    GetAdPackagesModelData({
        this.id,
        this.count,
        this.price,
    });

    factory GetAdPackagesModelData.fromJson(Map<String, dynamic> json) => GetAdPackagesModelData(
        id: json["id"],
        count: json["count"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "price": price,
    };
}
