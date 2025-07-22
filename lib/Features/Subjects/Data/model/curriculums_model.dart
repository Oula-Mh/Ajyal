import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';

class Curriculum {
  final int id;
  final int courseId;
  final int subjectId;
  final SubjectModel subject;

  Curriculum({
    required this.id,
    required this.courseId,
    required this.subjectId,
    required this.subject,
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) {
    return Curriculum(
      id: json['id'],
      courseId: json['course_id'],
      subjectId: json['subject_id'],
      subject: SubjectModel.fromJson(json['subject']),
    );
  }
}
