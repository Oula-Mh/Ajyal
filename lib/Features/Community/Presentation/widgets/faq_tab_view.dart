import 'package:ajyal/Features/Community/Data/models/issue_list_model.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/question_list_view.dart';
import 'package:flutter/material.dart';

class FaqTabView extends StatelessWidget {
  final List<IssueModel> questions;
  const FaqTabView({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return QuestionListView(questions: questions, tybeBar: 0);
  }
}
