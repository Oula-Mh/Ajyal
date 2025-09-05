import 'package:ajyal/Features/Community/Data/models/issue_list_model.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/qustion_card.dart';
import 'package:flutter/material.dart';

class QuestionListView extends StatelessWidget {
  final List<IssueModel> questions;
  final int? id;
  final int tybeBar;
  const QuestionListView({
    super.key,
    required this.questions,
    required this.tybeBar,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return questions.isEmpty
        ? Center(child: Text("لا يوجد أسئلة"))
        : ListView.separated(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return QuestionCard(question: questions[index], tybeBar: tybeBar);
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
