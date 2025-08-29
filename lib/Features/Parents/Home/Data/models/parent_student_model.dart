class ParentStudentModel {
  int? id;
  int? userId;
  int? studentIdNumber;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? numberCivial;
  String? address;
  String? classLevel;
  String? birthdate;
  String? accessCode;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  ParentStudentModel({
    this.id,
    this.userId,
    this.studentIdNumber,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.numberCivial,
    this.address,
    this.classLevel,
    this.birthdate,
    this.accessCode,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  ParentStudentModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    studentIdNumber = json["student_Id_number"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    fatherName = json["father_name"];
    motherName = json["mother_name"];
    numberCivial = json["number_civial"];
    address = json["address"];
    classLevel = json["class_level"];
    birthdate = json["birthdate"];
    accessCode = json["access_code"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
  }

  static List<ParentStudentModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ParentStudentModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["student_Id_number"] = studentIdNumber;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["father_name"] = fatherName;
    _data["mother_name"] = motherName;
    _data["number_civial"] = numberCivial;
    _data["address"] = address;
    _data["class_level"] = classLevel;
    _data["birthdate"] = birthdate;
    _data["access_code"] = accessCode;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if (pivot != null) {
      _data["pivot"] = pivot?.toJson();
    }
    return _data;
  }

  ParentStudentModel copyWith({
    int? id,
    int? userId,
    int? studentIdNumber,
    String? firstName,
    String? lastName,
    String? fatherName,
    String? motherName,
    String? numberCivial,
    String? address,
    String? classLevel,
    String? birthdate,
    String? accessCode,
    String? createdAt,
    String? updatedAt,
    Pivot? pivot,
  }) => ParentStudentModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    studentIdNumber: studentIdNumber ?? this.studentIdNumber,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    fatherName: fatherName ?? this.fatherName,
    motherName: motherName ?? this.motherName,
    numberCivial: numberCivial ?? this.numberCivial,
    address: address ?? this.address,
    classLevel: classLevel ?? this.classLevel,
    birthdate: birthdate ?? this.birthdate,
    accessCode: accessCode ?? this.accessCode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pivot: pivot ?? this.pivot,
  );
}

class Pivot {
  int? parentModelId;
  int? studentId;

  Pivot({this.parentModelId, this.studentId});

  Pivot.fromJson(Map<String, dynamic> json) {
    parentModelId = json["parent_model_id"];
    studentId = json["student_id"];
  }

  static List<Pivot> fromList(List<Map<String, dynamic>> list) {
    return list.map(Pivot.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["parent_model_id"] = parentModelId;
    _data["student_id"] = studentId;
    return _data;
  }

  Pivot copyWith({int? parentModelId, int? studentId}) => Pivot(
    parentModelId: parentModelId ?? this.parentModelId,
    studentId: studentId ?? this.studentId,
  );
}
