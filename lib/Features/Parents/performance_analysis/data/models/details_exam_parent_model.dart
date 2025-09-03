class ExamDetailsParentModel {
  final List<ExamParentModel> paperExams;
  final List<ExamParentModel> quizzes;

  ExamDetailsParentModel({required this.paperExams, required this.quizzes});

  factory ExamDetailsParentModel.fromJson(Map<String, dynamic> json) {
    return ExamDetailsParentModel(
      paperExams:
          (json['paper_exams'] as List)
              .map((e) => ExamParentModel.fromJson(e))
              .toList(),
      quizzes:
          (json['quizzes'] as List)
              .map((e) => ExamParentModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "paper_exams": paperExams.map((e) => e.toJson()).toList(),
      "quizzes": quizzes.map((e) => e.toJson()).toList(),
    };
  }
}

class ExamParentModel {
  final int id;
  final int curriculumId;
  final String quizName;
  final String examDate;
  final double? result;
  final int maxScore;

  ExamParentModel({
    required this.id,
    required this.curriculumId,
    required this.quizName,
    required this.examDate,
    required this.result,
    required this.maxScore,
  });

  factory ExamParentModel.fromJson(Map<String, dynamic> json) {
    return ExamParentModel(
      id: json['id'],
      curriculumId: json['curriculum_id'],
      quizName: json['quiz_name'],
      examDate: json['exam_date'],
      result: (json['result'] as num).toDouble(),
      maxScore: json['max_score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "curriculum_id": curriculumId,
      "quiz_name": quizName,
      "exam_date": examDate,
      "result": result,
      "max_score": maxScore,
    };
  }
}
