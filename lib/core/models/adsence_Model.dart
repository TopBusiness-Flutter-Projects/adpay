class AdsenceModel {
  final List<Ad>? data;
  final String? msg;
  final int? status;

  AdsenceModel({this.data, this.msg, this.status});

  factory AdsenceModel.fromJson(Map<String, dynamic> json) {
    return AdsenceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Ad.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }
}

class Ad {
  final int? id;
  final String? image;
  final String? titleAr;
  final String? titleEn;
  final String? descriptionAr;
  final String? descriptionEn;
  final int? userId;
  final int? status;
  final int? paymentStatus;
  final int? countViews;
  final int? packageId;
  final int? views;
  final int? complete;
  final dynamic video;
  final String? subname;
  final String? createdAt;
  final String? updatedAt;

  Ad({
    this.id,
    this.image,
    this.titleAr,
    this.titleEn,
    this.descriptionAr,
    this.descriptionEn,
    this.userId,
    this.status,
    this.paymentStatus,
    this.countViews,
    this.packageId,
    this.views,
    this.complete,
    this.video,
    this.subname,
    this.createdAt,
    this.updatedAt,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'] as int?,
      image: json['image'] as String?,
      titleAr: json['title_ar'] as String?,
      titleEn: json['title_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      descriptionEn: json['description_en'] as String?,
      userId: json['user_id'] as int?,
      status: json['status'] as int?,
      paymentStatus: json['payment_status'] as int?,
      countViews: json['count_views'] as int?,
      packageId: json['package_id'] as int?,
      views: json['views'] as int?,
      complete: json['complete'] as int?,
      video: json['video'],
      subname: json['subname'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
