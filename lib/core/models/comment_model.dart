class CommentsModel {
  Data? data;
  String? msg;
  int? status;

  CommentsModel({this.data, this.msg, this.status});

  // fromJson factory method
  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      msg: json['msg'] ,
      status: json['status'] ,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  dynamic? userId;
  String? auctionId;
  String? type;
  String? comment;
  String? commentId;
  String? updatedAt;
  String? createdAt;
  dynamic? id;

  Data({
    this.userId,
    this.auctionId,
    this.type,
    this.comment,
    this.commentId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  // fromJson factory method
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['user_id'],
      auctionId: json['auction_id'],
      type: json['type'] ,
      comment: json['comment'],
      commentId: json['comment_id'] ,
      updatedAt: json['updated_at'] ,
      createdAt: json['created_at'] ,
      id: json['id'] ,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = this.userId;
    data['auction_id'] = this.auctionId;
    data['type'] = this.type;
    data['comment'] = this.comment;
    data['comment_id'] = this.commentId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
