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

/* ********************************************* */

/// صياغة الوقت "دقائق:ثواني"
String formatTime(int seconds) {
  int minutes = seconds ~/ 60;
  int secs = seconds % 60;
  return "$minutes:${secs.toString().padLeft(2, '0')}";
}

/// لون المؤقت بناءً على الوقت المتبقي
Color getTimerColor(int totalTime, int timeLeft) {
  final halfTime = totalTime / 2;
  final quarterTime = totalTime / 4;

  if (timeLeft <= quarterTime) {
    return Colors.red;
  } else if (timeLeft <= halfTime) {
    return Colors.orange;
  } else {
    return const Color.fromARGB(255, 184, 138, 168);
  }
}

/// تجهيز جميع الأسئلة الفرعية والفرعية-الرئيسية
List<Map<String, dynamic>> buildAllSubQuestions(
  List<QuestionCurrentModel> questions,
) {
  final allSubQuestions = <Map<String, dynamic>>[];

  for (var q in questions) {
    if (q.children.isEmpty && q.parentQuestionId == null) {
      allSubQuestions.add({"main": q, "sub": q});
    } else {
      for (var child in q.children) {
        allSubQuestions.add({"main": q, "sub": child});
      }
    }
  }
  return allSubQuestions;
}
