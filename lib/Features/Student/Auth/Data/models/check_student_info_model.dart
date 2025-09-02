class CheckStudentInfoModel {
  String? message;
  Data? data;

  CheckStudentInfoModel({this.message, this.data});

  CheckStudentInfoModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<CheckStudentInfoModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CheckStudentInfoModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  CheckStudentInfoModel copyWith({String? message, Data? data}) =>
      CheckStudentInfoModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class Data {
  int? id;
  int? userId;
  int? studentIdNumber;
  String? firstName;
  String? lastName;
  String? accessCode;
  String? numberCivial;
  String? address;
  String? fatherName;
  String? motherName;
  String? classLevel;
  String? createdAt;

  Data({
    this.id,
    this.userId,
    this.studentIdNumber,
    this.firstName,
    this.lastName,
    this.accessCode,
    this.numberCivial,
    this.address,
    this.fatherName,
    this.motherName,
    this.classLevel,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    studentIdNumber = json["student_Id_number"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    accessCode = json["access_code"];
    numberCivial = json["number_civial"];
    address = json["address"];
    fatherName = json["father_name"];
    motherName = json["mother_name"];
    classLevel = json["class_level"];
    createdAt = json["created_at"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["student_Id_number"] = studentIdNumber;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["access_code"] = accessCode;
    _data["number_civial"] = numberCivial;
    _data["address"] = address;
    _data["father_name"] = fatherName;
    _data["mother_name"] = motherName;
    _data["class_level"] = classLevel;
    _data["created_at"] = createdAt;
    return _data;
  }

  Data copyWith({
    int? id,
    int? userId,
    int? studentIdNumber,
    String? firstName,
    String? lastName,
    String? accessCode,
    String? numberCivial,
    String? address,
    String? fatherName,
    String? motherName,
    String? classLevel,
    String? createdAt,
  }) => Data(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    studentIdNumber: studentIdNumber ?? this.studentIdNumber,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    accessCode: accessCode ?? this.accessCode,
    numberCivial: numberCivial ?? this.numberCivial,
    address: address ?? this.address,
    fatherName: fatherName ?? this.fatherName,
    motherName: motherName ?? this.motherName,
    classLevel: classLevel ?? this.classLevel,
    createdAt: createdAt ?? this.createdAt,
  );
}
