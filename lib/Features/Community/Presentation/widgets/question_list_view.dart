import 'package:ajyal/Features/Community/Presentation/Pages/all_question_page.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/qustion_card.dart';
import 'package:flutter/material.dart';

class QuestionListView extends StatelessWidget {
  final List<Question> questions;

  const QuestionListView({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return QuestionCard(question: questions[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey.shade400, // Divider color
          thickness: 1.5, // Divider thickness
          indent: 20, // Empty space before divider
          endIndent: 20, // Empty space after divider
        );
      },
    );
  }
}
