class FullQuestionPre {
  final String? mainText;
  final String? imageUrl;
  final List<SubQuestionPre> subQuestions;

  FullQuestionPre({
    required this.mainText,
    this.imageUrl,
    required this.subQuestions,
  });
}

class SubQuestionPre {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final int userSelectedIndex;
  final String? hint;

  SubQuestionPre({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.userSelectedIndex,
    this.hint,
  });
}
