import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:flutter/material.dart';
import '../Exam_current/question_card_current.dart';

class QuestionsPageView extends StatelessWidget {
  final PageController pageController;
  final List<Map<String, dynamic>> allSubQuestions;
  final int timeLeft;
  final void Function(QuestionCurrentModel sub, int index) onOptionSelected;
  final void Function(int index) onPageChanged;

  const QuestionsPageView({
    super.key,
    required this.pageController,
    required this.allSubQuestions,
    required this.timeLeft,
    required this.onOptionSelected,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (allSubQuestions.isEmpty) return const SizedBox.shrink();

    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: allSubQuestions.length,
      itemBuilder: (context, index) {
        final main = allSubQuestions[index]["main"] as QuestionCurrentModel;
        final sub = allSubQuestions[index]["sub"] as QuestionCurrentModel;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: QuestionCardCurrent(
            main: main,
            sub: sub,
            timeLeft: timeLeft,
            onOptionSelected: (i) => onOptionSelected(sub, i),
          ),
        );
      },
    );
  }
}
