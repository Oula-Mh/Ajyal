import 'package:ajyal/Features/Community/Presentation/Pages/all_question_page.dart';
import 'package:ajyal/Features/Community/Presentation/widgets/question_list_view.dart';
import 'package:flutter/material.dart';

class FaqTabView extends StatelessWidget {
  final List<Question> questions;
  const FaqTabView({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: QuestionListView(questions: questions)),
        _buildEnterQuestionBar(),
      ],
    );
  }

  Widget _buildEnterQuestionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3), // changes position of shadow
          ),
        ],
        border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1.0)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter question...',
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.send, color: Colors.indigo[600]),
            onPressed: () {
              // Handle send action
            },
          ),
        ),
      ),
    );
  }
}
