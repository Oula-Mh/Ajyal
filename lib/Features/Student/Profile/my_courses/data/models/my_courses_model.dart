class MyCoursesModel {
  final String message;
  final List<Course> data;
  final int code;

  MyCoursesModel({
    required this.message,
    required this.data,
    required this.code,
  });

  factory MyCoursesModel.fromJson(Map<String, dynamic> json) {
    return MyCoursesModel(
      message: json['message'] ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Course.fromJson(e))
              .toList() ??
          [],
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "data": data.map((e) => e.toJson()).toList(),
      "code": code,
    };
  }
}

class Course {
  final int id;
  final String name;
  final String cost;
  final String type;
  final String startDate;
  final String endDate;
  final String code;
  final int capacity;
  final String createdAt;
  final String updatedAt;
  final List<ClassroomCourse> classroomCourses;

  Course({
    required this.id,
    required this.name,
    required this.cost,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.code,
    required this.capacity,
    required this.createdAt,
    required this.updatedAt,
    required this.classroomCourses,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'] ?? '',
      cost: json['cost'] ?? '',
      type: json['type'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      code: json['code'] ?? '',
      capacity: json['capacity'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      classroomCourses:
          (json['classroom_courses'] as List<dynamic>?)
              ?.map((e) => ClassroomCourse.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "cost": cost,
      "type": type,
      "start_date": startDate,
      "end_date": endDate,
      "code": code,
      "capacity": capacity,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "classroom_courses": classroomCourses.map((e) => e.toJson()).toList(),
    };
  }
}

class ClassroomCourse {
  final int id;
  final int courseId;
  final int classroomId;
  final int capacity;
  final String? createdAt;
  final String? updatedAt;
  final CourseImage? image;
  final Classroom classroom;
  final List<SortStudent> sortStudents;

  ClassroomCourse({
    required this.id,
    required this.courseId,
    required this.classroomId,
    required this.capacity,
    this.createdAt,
    this.updatedAt,
    this.image,
    required this.classroom,
    required this.sortStudents,
  });

  factory ClassroomCourse.fromJson(Map<String, dynamic> json) {
    return ClassroomCourse(
      id: json['id'],
      courseId: json['course_id'],
      classroomId: json['classroom_id'],
      capacity: json['capacity'] ?? 0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'] != null ? CourseImage.fromJson(json['image']) : null,
      classroom: Classroom.fromJson(json['classroom']),
      sortStudents:
          (json['sort_students'] as List<dynamic>?)
              ?.map((e) => SortStudent.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "course_id": courseId,
      "classroom_id": classroomId,
      "capacity": capacity,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "image": image?.toJson(),
      "classroom": classroom.toJson(),
      "sort_students": sortStudents.map((e) => e.toJson()).toList(),
    };
  }
}

class CourseImage {
  final int id;
  final String path;
  final String imageableType;
  final int imageableId;
  final String createdAt;
  final String updatedAt;

  CourseImage({
    required this.id,
    required this.path,
    required this.imageableType,
    required this.imageableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseImage.fromJson(Map<String, dynamic> json) {
    return CourseImage(
      id: json['id'],
      path: json['path'] ?? '',
      imageableType: json['imageable_type'] ?? '',
      imageableId: json['imageable_id'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "path": path,
      "imageable_type": imageableType,
      "imageable_id": imageableId,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

class Classroom {
  final int id;
  final String classNumber;
  final int capacity;
  final String createdAt;
  final String updatedAt;

  Classroom({
    required this.id,
    required this.classNumber,
    required this.capacity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['id'],
      classNumber: json['class_number'] ?? '',
      capacity: json['capacity'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "class_number": classNumber,
      "capacity": capacity,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}

class SortStudent {
  final int id;
  final int registrationId;
  final int classroomCourseId;
  final String? createdAt;
  final String? updatedAt;

  SortStudent({
    required this.id,
    required this.registrationId,
    required this.classroomCourseId,
    this.createdAt,
    this.updatedAt,
  });

  factory SortStudent.fromJson(Map<String, dynamic> json) {
    return SortStudent(
      id: json['id'],
      registrationId: json['registration_id'],
      classroomCourseId: json['classroom_course_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "registration_id": registrationId,
      "classroom_course_id": classroomCourseId,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
