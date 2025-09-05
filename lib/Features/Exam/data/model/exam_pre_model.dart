class ExamPreModel {
  final int id;
  final int? curriculumTeacherId;
  final int? curriculumId;
  final int? topicId;
  final String name;
  final String? type;
  final int? available;
  final String startTime;
  final String duration;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final StudentQuiz studentQuiz;

  ExamPreModel({
    required this.id,
    required this.curriculumTeacherId,
    required this.curriculumId,
    required this.topicId,
    required this.name,
    required this.type,
    required this.available,
    required this.startTime,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.studentQuiz,
  });

  factory ExamPreModel.fromJson(Map<String, dynamic> json) {
    return ExamPreModel(
      id: json['id'],
      curriculumTeacherId: json['curriculum_teacher_id'],
      curriculumId: json['curriculum_id'],
      topicId: json['topic_id'],
      name: json['name'],
      type: json['type'],
      available: json['available'],
      startTime: json['start_time'],
      duration: json['duration'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      studentQuiz: StudentQuiz.fromJson(json['student_quiz']),
    );
  }
}

class StudentQuiz {
  final int? studentId;
  final int? quizId;
  final double? result;
  final int? isSubmit;

  StudentQuiz({
    required this.studentId,
    required this.quizId,
    required this.result,
    required this.isSubmit,
  });

  factory StudentQuiz.fromJson(Map<String, dynamic> json) {
    return StudentQuiz(
      studentId: json['student_id'],
      quizId: json['quiz_id'],
      result:
          json['result'] != null
              ? double.tryParse(json['result'].toString())
              : null,
      isSubmit: json['is_submit'],
    );
  }
}
