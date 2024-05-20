class GradeDetailsModel {
  int? id;
  List<String> images;
  bool? isFav;
  final String titleAr;
  final String titleEn;
  final String descriptionAr;
  final String descriptionEn;
  final String? video;
  final Category category;
  final SubCategory subCategory;
  final String createdAt;
  final List<Comment> comments;
  final User user;

  GradeDetailsModel({
    this.id,
    required this.images,
    this.isFav,
    required this.titleAr,
    required this.titleEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.video,
    required this.category,
    required this.subCategory,
    required this.createdAt,
    required this.comments,
    required this.user,
  });

  factory GradeDetailsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return GradeDetailsModel(
      id: data['id'] ?? 0,
      images: List<String>.from(data['images'] ?? []),
      isFav: data['is_fav'] ?? false,
      titleAr: data['title_ar'] ?? '',
      titleEn: data['title_en'] ?? '',
      descriptionAr: data['description_ar'] ?? '',
      descriptionEn: data['description_en'] ?? '',
      video: data['video'],
      category: Category.fromJson(data['category'] ?? {}),
      subCategory: SubCategory.fromJson(data['sub_category'] ?? {}),
      createdAt: data['created_at'] ?? '',
      comments: List<Comment>.from((data['comments'] as List<dynamic>? ?? [])
          .map((x) => Comment.fromJson(x))),
      user: User.fromJson(data['user'] ?? {}),
    );
  }
}

class Category {
  final int id;
  final String titleAr;
  final String titleEn;
  final String createdAt;

  Category({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}

class SubCategory {
  final int id;
  final String titleAr;
  final String titleEn;
  final int catId;
  final String createdAt;

  SubCategory({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.catId,
    required this.createdAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'] ?? 0,
      titleAr: json['title_ar'] ?? '',
      titleEn: json['title_en'] ?? '',
      catId: json['cat_id'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class Comment {
  final int id;
  final String comment;
  final User user;
  final List<Comment> replies;
  final String createdAt;

  Comment({
    required this.id,
    required this.comment,
    required this.user,
    required this.replies,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] ?? 0,
      comment: json['comment'] ?? '',
      user: User.fromJson(json['user_id'] ?? {}),
      replies: List<Comment>.from((json['replies'] as List<dynamic>? ?? [])
          .map((x) => Comment.fromJson(x))),
      createdAt: json['created_at'] ?? '',
    );
  }
}

class User {
  final int id;
  final String name;
  final String image;
  final int phone;
  final String type;
  final String deviceToken;
  final String session;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.type,
    required this.deviceToken,
    required this.session,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      phone: json['phone'] ?? 0,
      type: json['type'] ?? '',
      deviceToken: json['device_token'] ?? '',
      session: json['session'] ?? '',
      token: json['token'] ?? '',
    );
  }
}
