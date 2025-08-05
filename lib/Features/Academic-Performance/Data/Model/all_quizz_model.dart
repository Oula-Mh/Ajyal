class AllQuizzesModel {
  final List<QuizItem> paperExams;
  final List<QuizItem> quiz;
  final List<QuizItem> both;

  AllQuizzesModel({
    required this.paperExams,
    required this.quiz,
    required this.both,
  });

  factory AllQuizzesModel.fromJson(Map<String, dynamic> json) {
    return AllQuizzesModel(
      paperExams:
          (json['paper_exams'] as List)
              .map((e) => QuizItem.fromJson(e))
              .toList(),
      quiz: (json['quiz'] as List).map((e) => QuizItem.fromJson(e)).toList(),
      both: (json['both'] as List).map((e) => QuizItem.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'paper_exams': paperExams.map((e) => e.toJson()).toList(),
      'quiz': quiz.map((e) => e.toJson()).toList(),
      'both': both.map((e) => e.toJson()).toList(),
    };
  }
}

class QuizItem {
  final int id;
  final int curriculumId;
  final String quizName;
  final String examDate;
  final String result;
  final int maxScore;

  QuizItem({
    required this.id,
    required this.curriculumId,
    required this.quizName,
    required this.examDate,
    required this.result,
    required this.maxScore,
  });

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      id: json['id'],
      curriculumId: json['curriculum_id'],
      quizName: json['quiz_name'],
      examDate: json['exam_date'],
      result: json['result'],
      maxScore: json['max_score'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'curriculum_id': curriculumId,
      'quiz_name': quizName,
      'exam_date': examDate,
      'result': result,
      'max_score': maxScore,
    };
  }
}
