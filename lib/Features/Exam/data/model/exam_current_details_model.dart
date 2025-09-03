class ExamCurrentDetailsModel {
  final List<QuestionCurrentModel> questions;

  ExamCurrentDetailsModel({required this.questions});

  factory ExamCurrentDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExamCurrentDetailsModel(
      questions:
          (json['data']['questions'] as List)
              .map((q) => QuestionCurrentModel.fromJson(q))
              .toList(),
    );
  }
}

class QuestionCurrentModel {
  final int id;
  final int quizId;
  final int? parentQuestionId;
  final String mark;
  final String questionText;
  final String? hint;
  final String? image;
  final List<ChoiceCurrentModel> choices;
  final List<QuestionCurrentModel> children;
  int userSelectedIndex;

  QuestionCurrentModel({
    required this.id,
    required this.quizId,
    this.parentQuestionId,
    required this.mark,
    required this.questionText,
    this.hint,
    this.image,
    required this.choices,
    required this.children,
    this.userSelectedIndex = -1,
  });

  factory QuestionCurrentModel.fromJson(Map<String, dynamic> json) {
    return QuestionCurrentModel(
      id: json['id'],
      quizId: json['quiz_id'],
      parentQuestionId: json['parent_question_id'],
      mark: json['mark'],
      questionText: json['question_text'],
      hint: json['hint'],
      image:
          json['image'] == null
              ? null
              : (json['image'] is Map
                  ? json['image']['path'].toString()
                  : json['image'].toString()),
      choices:
          (json['choices'] as List? ?? [])
              .map((c) => ChoiceCurrentModel.fromJson(c))
              .toList(),
      children:
          (json['children'] as List? ?? [])
              .map((child) => QuestionCurrentModel.fromJson(child))
              .toList(),
    );
  }
}

class ChoiceCurrentModel {
  final int id;
  final int questionId;
  final String choiceText;
  final int isCorrect;

  ChoiceCurrentModel({
    required this.id,
    required this.questionId,
    required this.choiceText,
    required this.isCorrect,
  });

  factory ChoiceCurrentModel.fromJson(Map<String, dynamic> json) {
    return ChoiceCurrentModel(
      id: json['id'],
      questionId: json['question_id'],
      choiceText: json['choice_text'],
      isCorrect: json['is_correct'],
    );
  }
}
