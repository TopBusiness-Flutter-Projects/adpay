class FavouriteModel {
   dynamic data;
   String ?msg;
   int ?status;

  FavouriteModel({
     this.data,
     this.msg,
     this.status,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      data: json['data'],
      msg: json['msg'],
      status: json['status'],
    );
  }
}
