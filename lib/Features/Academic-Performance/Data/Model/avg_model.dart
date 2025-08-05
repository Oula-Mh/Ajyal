class AnalysisAverageModel {
  final ExamAverage paperExam;
  final ExamAverage quiz;
  final double both;

  AnalysisAverageModel({
    required this.paperExam,
    required this.quiz,
    required this.both,
  });

  factory AnalysisAverageModel.fromJson(Map<String, dynamic> json) {
    return AnalysisAverageModel(
      paperExam: ExamAverage.fromJson(json['paper_exam']),
      quiz: ExamAverage.fromJson(json['quiz']),
      both: (json['both']['result'] as num).toDouble(),
    );
  }
}

class ExamAverage {
  final double averageScore;
  final int totalQuizzes;

  ExamAverage({required this.averageScore, required this.totalQuizzes});

  factory ExamAverage.fromJson(Map<String, dynamic> json) {
    return ExamAverage(
      averageScore: (json['average_score'] as num).toDouble(),
      totalQuizzes: json['total_quizzes'],
    );
  }
}
