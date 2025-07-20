class CourseDetailsModel {
  int? id;
  String? name;
  String? cost;
  String? type;
  String? startDate;
  String? endDate;
  int? capacity;
  String? createdAt;
  String? updatedAt;
  List<Curriculums>? curriculums;

  CourseDetailsModel({
    this.id,
    this.name,
    this.cost,
    this.type,
    this.startDate,
    this.endDate,
    this.capacity,
    this.createdAt,
    this.updatedAt,
    this.curriculums,
  });

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    cost = json["cost"];
    type = json["type"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    capacity = json["capacity"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    curriculums =
        json["curriculums"] == null
            ? null
            : (json["curriculums"] as List)
                .map((e) => Curriculums.fromJson(e))
                .toList();
  }

  static List<CourseDetailsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CourseDetailsModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["cost"] = cost;
    _data["type"] = type;
    _data["start_date"] = startDate;
    _data["end_date"] = endDate;
    _data["capacity"] = capacity;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (curriculums != null) {
      _data["curriculums"] = curriculums?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  CourseDetailsModel copyWith({
    int? id,
    String? name,
    String? cost,
    String? type,
    String? startDate,
    String? endDate,
    String? code,
    int? capacity,
    String? createdAt,
    String? updatedAt,
    List<Curriculums>? curriculums,
  }) => CourseDetailsModel(
    id: id ?? this.id,
    name: name ?? this.name,
    cost: cost ?? this.cost,
    type: type ?? this.type,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    capacity: capacity ?? this.capacity,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    curriculums: curriculums ?? this.curriculums,
  );
}

class Curriculums {
  int? id;
  int? courseId;
  int? subjectId;
  Subject? subject;
  List<Teachers>? teachers;

  Curriculums({
    this.id,
    this.courseId,
    this.subjectId,
    this.subject,
    this.teachers,
  });

  Curriculums.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    courseId = json["course_id"];
    subjectId = json["subject_id"];
    subject =
        json["subject"] == null ? null : Subject.fromJson(json["subject"]);
    teachers =
        json["teachers"] == null
            ? null
            : (json["teachers"] as List)
                .map((e) => Teachers.fromJson(e))
                .toList();
  }

  static List<Curriculums> fromList(List<Map<String, dynamic>> list) {
    return list.map(Curriculums.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["course_id"] = courseId;
    _data["subject_id"] = subjectId;
    if (subject != null) {
      _data["subject"] = subject?.toJson();
    }
    if (teachers != null) {
      _data["teachers"] = teachers?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Curriculums copyWith({
    int? id,
    int? courseId,
    int? subjectId,
    Subject? subject,
    List<Teachers>? teachers,
  }) => Curriculums(
    id: id ?? this.id,
    courseId: courseId ?? this.courseId,
    subjectId: subjectId ?? this.subjectId,
    subject: subject ?? this.subject,
    teachers: teachers ?? this.teachers,
  );
}

class Teachers {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? dateOfContract;
  String? phoneNumber;
  String? bio;
  String? createdAt;
  String? updatedAt;

  Teachers({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.dateOfContract,
    this.phoneNumber,
    this.bio,
    this.createdAt,
    this.updatedAt,
  });

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    name = json["name"];
    email = json["email"];
    dateOfContract = json["date_of_contract"];
    phoneNumber = json["phone_number"];
    bio = json["bio"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<Teachers> fromList(List<Map<String, dynamic>> list) {
    return list.map(Teachers.fromJson).toList();
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
    return _data;
  }

  Teachers copyWith({
    int? id,
    int? userId,
    String? name,
    String? email,
    String? dateOfContract,
    String? phoneNumber,
    String? bio,
    String? createdAt,
    String? updatedAt,
  }) => Teachers(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    email: email ?? this.email,
    dateOfContract: dateOfContract ?? this.dateOfContract,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    bio: bio ?? this.bio,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}

class Subject {
  int? id;
  String? name;
  String? subjectCode;
  String? type;
  String? description;
  int? archived;
  String? createdAt;
  String? updatedAt;

  Subject({
    this.id,
    this.name,
    this.subjectCode,
    this.type,
    this.description,
    this.archived,
    this.createdAt,
    this.updatedAt,
  });

  Subject.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    subjectCode = json["subject_code"];
    type = json["type"];
    description = json["description"];
    archived = json["archived"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<Subject> fromList(List<Map<String, dynamic>> list) {
    return list.map(Subject.fromJson).toList();
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

  Subject copyWith({
    int? id,
    String? name,
    String? subjectCode,
    String? type,
    String? description,
    int? archived,
    String? createdAt,
    String? updatedAt,
  }) => Subject(
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
