import 'package:ajyal/Features/Exam/Presentation/widgets/exam_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../Exam_current/question_grid_dialog_current.dart';

class ExamNavBar extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final List<Map<String, dynamic>> allSubQuestions;

  const ExamNavBar({
    required this.currentPage,
    required this.pageController,
    required this.allSubQuestions,
  });

  @override
  Widget build(BuildContext context) {
    if (allSubQuestions.isEmpty) return const SizedBox.shrink();

    return ExamNavigationBar(
      currentPage: currentPage,
      totalPages: allSubQuestions.length,
      onPrevious:
          currentPage > 0
              ? () => pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              )
              : null,
      onNext:
          currentPage < allSubQuestions.length - 1
              ? () => pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linearToEaseOut,
              )
              : null,
      onOpenGrid:
          () => showDialog(
            context: context,
            builder:
                (_) => QuestionGridDialogCurrent(
                  allSubQuestions: allSubQuestions,
                  currentPage: currentPage,
                  pageController: pageController,
                ),
          ),
    );
  }
}
