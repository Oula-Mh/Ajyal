class SubjectModel {
  final int id;
  final int courseId;
  final int subjectId;
  final int subjectInnerId;
  final String name;
  final String subjectCode;
  final String type;
  final String description;
  final int archived;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SubjectModel({
    required this.id,
    required this.courseId,
    required this.subjectId,
    required this.subjectInnerId,
    required this.name,
    required this.subjectCode,
    required this.type,
    required this.description,
    required this.archived,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    final subject = json['subject'] ?? {};

    return SubjectModel(
      id: json['id'] ?? 0,
      courseId: json['course_id'] ?? 0,
      subjectId: json['subject_id'] ?? 0,
      subjectInnerId: subject['id'] ?? 0,
      name: subject['name'] ?? '',
      subjectCode: subject['subject_code'] ?? '',
      type: subject['type'] ?? '',
      description: subject['description'] ?? '',
      archived: subject['archived'] ?? 0,
      createdAt:
          DateTime.tryParse(subject['created_at'] ?? '') ?? DateTime.now(),
      updatedAt:
          DateTime.tryParse(subject['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "course_id": courseId,
      "subject_id": subjectId,
      "subject": {
        "id": subjectInnerId,
        "name": name,
        "subject_code": subjectCode,
        "type": type,
        "description": description,
        "archived": archived,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      },
    };
  }
}
