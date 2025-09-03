import 'package:ajyal/Features/Community/Data/model/issue_list_model.dart';
import 'package:ajyal/Features/Community/Presentation/Pages/all_question_page.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/qustion_card.dart';
import 'package:flutter/material.dart';

class QuestionListView extends StatelessWidget {
  final List<IssueModel> questions;
  final int? id;
  const QuestionListView({super.key, required this.questions, this.id});

  @override
  Widget build(BuildContext context) {
    return questions.isEmpty
        ? Center(child: Text("لا يوجد أسئلة"))
        : ListView.separated(
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
