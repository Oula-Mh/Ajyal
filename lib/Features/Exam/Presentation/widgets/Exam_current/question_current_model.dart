class FullQuestionCurrent {
  final String? mainText;
  final String? imageUrl;
  final List<SubQuestionCurrent> subQuestions;

  FullQuestionCurrent({
    required this.mainText,
    this.imageUrl,
    required this.subQuestions,
  });
}

class SubQuestionCurrent {
  final String questionText;
  final List<String> options;
  int userSelectedIndex;

  SubQuestionCurrent({
    required this.questionText,
    required this.options,
    this.userSelectedIndex = -1,
  });
}