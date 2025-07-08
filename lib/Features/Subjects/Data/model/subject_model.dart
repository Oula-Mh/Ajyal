class SubjectModel {
  int? id;
  String? name;
  String? subjectCode;
  String? type;
  String? description;
  int? archived;
  String? createdAt;
  String? updatedAt;

  SubjectModel({
    this.id,
    this.name,
    this.subjectCode,
    this.type,
    this.description,
    this.archived,
    this.createdAt,
    this.updatedAt,
  });

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    subjectCode = json["subject_code"];
    type = json["type"];
    description = json["description"];
    archived = json["archived"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<SubjectModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubjectModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["subject_code"] = subjectCode;
    _data["type"] = type;
    _data["description"] = description;
    _data["archived"] = archived;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  SubjectModel copyWith({
    int? id,
    String? name,
    String? subjectCode,
    String? type,
    String? description,
    int? archived,
    String? createdAt,
    String? updatedAt,
  }) => SubjectModel(
    id: id ?? this.id,
    name: name ?? this.name,
    subjectCode: subjectCode ?? this.subjectCode,
    type: type ?? this.type,
    description: description ?? this.description,
    archived: archived ?? this.archived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
