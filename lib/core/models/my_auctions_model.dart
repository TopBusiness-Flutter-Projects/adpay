class MyAuctionsModel {
  final List<AuctionData> data;
  final String msg;
  final int status;

  MyAuctionsModel({
    required this.data,
    required this.msg,
    required this.status,
  });

  factory MyAuctionsModel.fromJson(Map<String, dynamic> json) {
    return MyAuctionsModel(
      data: (json['data'] as List)
          .map((item) => AuctionData.fromJson(item))
          .toList(),
      msg: json['msg'],
      status: json['status'],
    );
  }
}

class AuctionData {
  final int id;
  final List<dynamic> images;
  final bool isFav;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String descriptionEn;
  final String? video;
  final Category category;
  final SubCategory subCategory;
  final String createdAt;
  final List<dynamic> comments;
  final dynamic user;

  AuctionData({
    required this.id,
    required this.images,
    required this.isFav,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    this.video,
    required this.category,
    required this.subCategory,
    required this.createdAt,
    required this.comments,
    this.user,
  });

  factory AuctionData.fromJson(Map<String, dynamic> json) {
    return AuctionData(
      id: json['id'],
      images: json['images'] as List<dynamic>,
      isFav: json['is_fav'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      descriptionAr: json['description_ar'],
      descriptionEn: json['description_en'],
      video: json['video'],
      category: Category.fromJson(json['category']),
      subCategory: SubCategory.fromJson(json['sub_category']),
      createdAt: json['created_at'],
      comments: json['comments'] as List<dynamic>,
      user: json['user'],
    );
  }
}

class Category {
  final int id;
  final String titleAr;
  final String titleEn;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class SubCategory {
  final int id;
  final String titleAr;
  final String titleEn;
  final dynamic catId;
  final String createdAt;
  final String updatedAt;

  SubCategory({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.catId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      titleAr: json['title_ar'],
      titleEn: json['title_en'],
      catId: json['cat_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
