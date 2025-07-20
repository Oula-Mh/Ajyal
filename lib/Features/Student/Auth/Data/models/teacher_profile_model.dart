class TeacherProfileModel {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? dateOfContract;
  String? phoneNumber;
  String? bio;
  String? createdAt;
  String? updatedAt;
  Image? image;

  TeacherProfileModel({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.dateOfContract,
    this.phoneNumber,
    this.bio,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    name = json["name"];
    email = json["email"];
    dateOfContract = json["date_of_contract"];
    phoneNumber = json["phone_number"];
    bio = json["bio"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    image = json["image"] == null ? null : Image.fromJson(json["image"]);
  }

  static List<TeacherProfileModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(TeacherProfileModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["name"] = name;
    _data["email"] = email;
    _data["date_of_contract"] = dateOfContract;
    _data["phone_number"] = phoneNumber;
    _data["bio"] = bio;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (image != null) {
      _data["image"] = image?.toJson();
    }
    return _data;
  }

  TeacherProfileModel copyWith({
    int? id,
    int? userId,
    String? name,
    String? email,
    String? dateOfContract,
    String? phoneNumber,
    String? bio,
    String? createdAt,
    String? updatedAt,
    Image? image,
  }) => TeacherProfileModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    email: email ?? this.email,
    dateOfContract: dateOfContract ?? this.dateOfContract,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    bio: bio ?? this.bio,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    image: image ?? this.image,
  );
}

class Image {
  int? id;
  String? path;
  String? imageableType;
  int? imageableId;
  String? createdAt;
  String? updatedAt;

  Image({
    this.id,
    this.path,
    this.imageableType,
    this.imageableId,
    this.createdAt,
    this.updatedAt,
  });

  Image.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    path = json["path"];
    imageableType = json["imageable_type"];
    imageableId = json["imageable_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<Image> fromList(List<Map<String, dynamic>> list) {
    return list.map(Image.fromJson).toList();
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

  Image copyWith({
    int? id,
    String? path,
    String? imageableType,
    int? imageableId,
    String? createdAt,
    String? updatedAt,
  }) => Image(
    id: id ?? this.id,
    path: path ?? this.path,
    imageableType: imageableType ?? this.imageableType,
    imageableId: imageableId ?? this.imageableId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
