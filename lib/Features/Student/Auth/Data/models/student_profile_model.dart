class StudentProfileModel {
  String? message;
  ProfileData? data;
  int? code;

  StudentProfileModel({this.message, this.data, this.code});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : ProfileData.fromJson(json["data"]);
    code = json["code"];
  }

  static List<StudentProfileModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(StudentProfileModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["code"] = code;
    return _data;
  }

  StudentProfileModel copyWith({
    String? message,
    ProfileData? data,
    int? code,
  }) => StudentProfileModel(
    message: message ?? this.message,
    data: data ?? this.data,
    code: code ?? this.code,
  );
}

class ProfileData {
  int? id;
  RoleData? roleData;
  String? role;
  String? studentId;

  ProfileData({this.id, this.roleData, this.role, this.studentId});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    roleData =
        json["role_data"] == null ? null : RoleData.fromJson(json["role_data"]);
    role = json["role"];
    studentId = json["student_id"];
  }

  static List<ProfileData> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProfileData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (roleData != null) {
      _data["role_data"] = roleData?.toJson();
    }
    _data["role"] = role;
    _data["student_id"] = studentId;
    return _data;
  }

  ProfileData copyWith({
    int? id,
    RoleData? roleData,
    String? role,
    String? studentId,
  }) => ProfileData(
    id: id ?? this.id,
    roleData: roleData ?? this.roleData,
    role: role ?? this.role,
    studentId: studentId ?? this.studentId,
  );
}

class RoleData {
  int? id;
  int? userId;
  int? studentIdNumber;
  String? firstName;
  String? lastName;
  dynamic numberCivial;
  String? address;
  dynamic motherName;
  dynamic fatherName;
  String? accessCode;
  String? createdAt;
  String? updatedAt;

  RoleData({
    this.id,
    this.userId,
    this.studentIdNumber,
    this.firstName,
    this.lastName,
    this.numberCivial,
    this.address,
    this.motherName,
    this.fatherName,
    this.accessCode,
    this.createdAt,
    this.updatedAt,
  });

  RoleData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    studentIdNumber = json["student_Id_number"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    numberCivial = json["number_civial"];
    address = json["address"];
    motherName = json["mother_name"];
    fatherName = json["father_name"];
    accessCode = json["access_code"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<RoleData> fromList(List<Map<String, dynamic>> list) {
    return list.map(RoleData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["user_id"] = userId;
    _data["student_Id_number"] = studentIdNumber;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["number_civial"] = numberCivial;
    _data["address"] = address;
    _data["mother_name"] = motherName;
    _data["father_name"] = fatherName;
    _data["access_code"] = accessCode;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  RoleData copyWith({
    int? id,
    int? userId,
    int? studentIdNumber,
    String? firstName,
    String? lastName,
    dynamic numberCivial,
    String? address,
    dynamic motherName,
    dynamic fatherName,
    String? accessCode,
    String? createdAt,
    String? updatedAt,
  }) => RoleData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    studentIdNumber: studentIdNumber ?? this.studentIdNumber,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    numberCivial: numberCivial ?? this.numberCivial,
    address: address ?? this.address,
    motherName: motherName ?? this.motherName,
    fatherName: fatherName ?? this.fatherName,
    accessCode: accessCode ?? this.accessCode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
