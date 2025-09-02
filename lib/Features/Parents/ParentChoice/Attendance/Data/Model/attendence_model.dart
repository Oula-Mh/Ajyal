class CourseAbsenceModel {
  final String message;
  final int code;
  final Course course;
  final List<AbsenceDay> absenceDays;

  CourseAbsenceModel({
    required this.message,
    required this.code,
    required this.course,
    required this.absenceDays,
  });

  factory CourseAbsenceModel.fromJson(Map<String, dynamic> json) {
    return CourseAbsenceModel(
      message: json['message'],
      code: json['code'],
      course: Course.fromJson(json['data']['course']),
      absenceDays:
          (json['data']['absence_days'] as List)
              .map((e) => AbsenceDay.fromJson(e))
              .toList(),
    );
  }
}

class Course {
  final int id;
  final String name;
  final String cost;
  final String type;
  final DateTime startDate;
  final DateTime endDate;
  final String code;
  final int capacity;

  Course({
    required this.id,
    required this.name,
    required this.cost,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.code,
    required this.capacity,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      type: json['type'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      code: json['code'],
      capacity: json['capacity'],
    );
  }
}

class AbsenceDay {
  final int id;
  final int classroomCourseId;
  final DateTime absenceDate;

  AbsenceDay({
    required this.id,
    required this.classroomCourseId,
    required this.absenceDate,
  });

  factory AbsenceDay.fromJson(Map<String, dynamic> json) {
    return AbsenceDay(
      id: json['id'],
      classroomCourseId: json['classroom_course_id'],
      absenceDate: DateTime.parse(json['absence_date']),
    );
  }
}
