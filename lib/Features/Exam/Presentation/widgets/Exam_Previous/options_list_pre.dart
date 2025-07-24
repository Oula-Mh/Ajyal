import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/question_pre_model.dart';
import 'package:flutter/material.dart';

class OptionsListPre extends StatelessWidget {
  final SubQuestionPre subQuestion;

  const OptionsListPre({super.key, required this.subQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(subQuestion.options.length, (i) {
        Color borderColor = Colors.grey.shade400;
        Color containerColor = Colors.white;
        Color correct = const Color(0xFFEFF9EF);
        Color incorrect = const Color(0xFFF9EBEB);

        if (i == subQuestion.correctAnswerIndex &&
            i == subQuestion.userSelectedIndex) {
          borderColor = Colors.green;
          containerColor = correct;
        } else if (i == subQuestion.correctAnswerIndex) {
          borderColor = Colors.green;
          containerColor = correct;
        } else if (i == subQuestion.userSelectedIndex) {
          borderColor = Colors.red;
          containerColor = incorrect;
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
              Icon(
                i == subQuestion.correctAnswerIndex
                    ? Icons.check_circle
                    : i == subQuestion.userSelectedIndex
                    ? Icons.cancel
                    : Icons.circle_outlined,
                color:
                    i == subQuestion.correctAnswerIndex
                        ? Colors.green
                        : i == subQuestion.userSelectedIndex
                        ? Colors.red
                        : Colors.grey,
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(subQuestion.options[i])),
            ],
          ),
        );
      }),
    );
  }
}
