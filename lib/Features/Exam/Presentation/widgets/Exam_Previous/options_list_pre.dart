import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
import 'package:flutter/material.dart';

class OptionsListPre extends StatelessWidget {
  final QuestionPreModel subQuestion;

  const OptionsListPre({super.key, required this.subQuestion});

  @override
  Widget build(BuildContext context) {
    final correct = subQuestion.correctChoice;
    final selected = subQuestion.studentAnswer;
    final bool studentDidNotAnswer = selected == null;

    return Column(
      children: List.generate(subQuestion.choices.length, (i) {
        final choice = subQuestion.choices[i];

        // هل هو الخيار الصحيح؟
        bool isCorrect = correct != null && choice.id == correct.id;
        // هل هو الخيار الذي اختاره الطالب؟
        bool isSelected = selected != null && choice.id == selected.id;

        // الألوان الافتراضية
        Color borderColor = Colors.grey.shade400;
        Color containerColor = Colors.white;

        Color correctColor = const Color(0xFFEFF9EF); // أخضر فاتح
        Color incorrectColor = const Color(0xFFF9EBEB); // أحمر فاتح

        // منطق التلوين
        if (studentDidNotAnswer) {
          // لم يجب الطالب: الكل أحمر إلا الصحيح
          if (isCorrect) {
            borderColor = Colors.green;
            containerColor = correctColor;
          } else {
            borderColor = Colors.red;
            containerColor = incorrectColor;
          }
        } else {
          // أجاب الطالب: عادي
          if (isCorrect && isSelected) {
            borderColor = Colors.green;
            containerColor = correctColor;
          } else if (isCorrect) {
            borderColor = Colors.green;
            containerColor = correctColor;
          } else if (isSelected) {
            borderColor = Colors.red;
            containerColor = incorrectColor;
          }
        }

        // منطق الأيقونات
        IconData icon;
        Color iconColor;

        if (isCorrect) {
          icon = Icons.check_circle;
          iconColor = Colors.green;
        } else if (isSelected || studentDidNotAnswer) {
          icon = Icons.cancel;
          iconColor = Colors.red;
        } else {
          icon = Icons.circle_outlined;
          iconColor = Colors.grey;
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
            color: containerColor,
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  choice.choiceText,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
