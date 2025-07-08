class CourseAdvModel {
  int? id;
  String? title;
  String? body;
  String? advertisableType;
  int? advertisableId;
  String? createdAt;
  String? updatedAt;
  List<Images>? images;

  CourseAdvModel({
    this.id,
    this.title,
    this.body,
    this.advertisableType,
    this.advertisableId,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  CourseAdvModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    body = json["body"];
    advertisableType = json["advertisable_type"];
    advertisableId = json["advertisable_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    images =
        json["images"] == null
            ? null
            : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
  }

  static List<CourseAdvModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CourseAdvModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    _data["advertisable_type"] = advertisableType;
    _data["advertisable_id"] = advertisableId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  CourseAdvModel copyWith({
    int? id,
    String? title,
    String? body,
    String? advertisableType,
    int? advertisableId,
    String? createdAt,
    String? updatedAt,
    List<Images>? images,
  }) => CourseAdvModel(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    advertisableType: advertisableType ?? this.advertisableType,
    advertisableId: advertisableId ?? this.advertisableId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    images: images ?? this.images,
  );
}

class Images {
  int? id;
  String? path;
  String? imageableType;
  int? imageableId;
  String? createdAt;
  String? updatedAt;

  Images({
    this.id,
    this.path,
    this.imageableType,
    this.imageableId,
    this.createdAt,
    this.updatedAt,
  });

  Images.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    path = json["path"];
    imageableType = json["imageable_type"];
    imageableId = json["imageable_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<Images> fromList(List<Map<String, dynamic>> list) {
    return list.map(Images.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["path"] = path;
    _data["imageable_type"] = imageableType;
    _data["imageable_id"] = imageableId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  Images copyWith({
    int? id,
    String? path,
    String? imageableType,
    int? imageableId,
    String? createdAt,
    String? updatedAt,
  }) => Images(
    id: id ?? this.id,
    path: path ?? this.path,
    imageableType: imageableType ?? this.imageableType,
    imageableId: imageableId ?? this.imageableId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
