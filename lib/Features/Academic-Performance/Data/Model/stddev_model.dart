class AnalysisStddevModel {
  double? paperExam;
  double? quiz;
  double? both;

  AnalysisStddevModel({this.paperExam, this.quiz, this.both});

  AnalysisStddevModel.fromJson(Map<String, dynamic> json) {
    paperExam = (json["paper_exam"] as num?)?.toDouble();
    quiz = (json["quiz"] as num?)?.toDouble();
    both = (json["both"] as num?)?.toDouble();
  }

  static List<AnalysisStddevModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(AnalysisStddevModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["paper_exam"] = paperExam;
    _data["quiz"] = quiz;
    _data["both"] = both;
    return _data;
  }

  AnalysisStddevModel copyWith({
    double? paperExam,
    double? quiz,
    double? both,
  }) => AnalysisStddevModel(
    paperExam: paperExam ?? this.paperExam,
    quiz: quiz ?? this.quiz,
    both: both ?? this.both,
  );
}
