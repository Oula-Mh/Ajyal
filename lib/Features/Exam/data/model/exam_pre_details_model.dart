class ExamPreDetailsModel {
  final List<QuestionPreModel> questions;

  ExamPreDetailsModel({required this.questions});

  factory ExamPreDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExamPreDetailsModel(
      questions:
          (json['data']['questions'] as List)
              .map((q) => QuestionPreModel.fromJson(q))
              .toList(),
    );
  }
}

class QuestionPreModel {
  final int id;
  final int? quizId;
  final int? parentQuestionId;
  final String? mark;
  final String questionText;
  final String? hint;
  final String? image;
  final List<ChoicePreModel> choices;
  final ChoicePreModel? correctChoice;
  final ChoicePreModel? studentAnswer;
  final List<QuestionPreModel> children;

  QuestionPreModel({
    required this.id,
    required this.quizId,
    this.parentQuestionId,
    required this.mark,
    required this.questionText,
    required this.hint,
    this.image,
    required this.choices,
    this.correctChoice,
    this.studentAnswer,
    required this.children,
  });

  factory QuestionPreModel.fromJson(Map<String, dynamic> json) {
    return QuestionPreModel(
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
          (json['choices'] as List)
              .map((c) => ChoicePreModel.fromJson(c))
              .toList(),
      correctChoice:
          json['correct_choice'] != null
              ? ChoicePreModel.fromJson(json['correct_choice'])
              : null,
      studentAnswer:
          json['student_answer'] != null
              ? ChoicePreModel.fromJson(json['student_answer'])
              : null,
      children:
          (json['children'] as List)
              .map((child) => QuestionPreModel.fromJson(child))
              .toList(),
    );
  }
}

class ChoicePreModel {
  final int id;
  final int questionId;
  final String choiceText;
  final int isCorrect;

  ChoicePreModel({
    required this.id,
    required this.questionId,
    required this.choiceText,
    required this.isCorrect,
  });

  factory ChoicePreModel.fromJson(Map<String, dynamic> json) {
    return ChoicePreModel(
      id: json['id'],
      questionId: json['question_id'],
      choiceText: json['choice_text'],
      isCorrect: json['is_correct'],
    );
  }
}
