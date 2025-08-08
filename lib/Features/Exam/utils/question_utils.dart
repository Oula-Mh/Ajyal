import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//****************************************************** */

List<QuestionCurrentModel> flattenQuestions(
  List<QuestionCurrentModel> questions,
) {
  final List<QuestionCurrentModel> all = [];
  for (final question in questions) {
    if (question.children.isNotEmpty) {
      all.addAll(flattenQuestions(question.children));
    } else {
      all.add(question);
    }
  }
  return all;
}

//*******************************************************/

Map<String, dynamic> buildFormData(ExamCurrentDetailsModel model) {
  final allQuestions = flattenQuestions(model.questions);

  return {
    "quiz_id": model.questions.first.quizId,
    "answers":
        allQuestions.map((question) {
          return {
            "question_id": question.id,
            "choice_id":
                question.userSelectedIndex != -1
                    ? question.choices[question.userSelectedIndex].id
                    : null,
          };
        }).toList(),
  };
}
//********************************************************** */

Future<bool> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String content,
  String confirmText = "نعم",
  String cancelText = "إلغاء",
}) async {
  return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(cancelText),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(confirmText),
                ),
              ],
            ),
      ) ??
      false;
}
