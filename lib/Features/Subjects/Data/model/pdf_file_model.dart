class PdfFileModel {
  int? id;
  String? title;
  String? filePath;
  int? curriculumId;
  String? createdAt;
  String? updatedAt;

  PdfFileModel({
    this.id,
    this.title,
    this.filePath,
    this.curriculumId,
    this.createdAt,
    this.updatedAt,
  });

  PdfFileModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    filePath = json["file_path"];
    curriculumId = json["curriculum_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<PdfFileModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(PdfFileModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["file_path"] = filePath;
    _data["curriculum_id"] = curriculumId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  PdfFileModel copyWith({
    int? id,
    String? title,
    String? filePath,
    int? curriculumId,
    String? createdAt,
    String? updatedAt,
  }) => PdfFileModel(
    id: id ?? this.id,
    title: title ?? this.title,
    filePath: filePath ?? this.filePath,
    curriculumId: curriculumId ?? this.curriculumId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
