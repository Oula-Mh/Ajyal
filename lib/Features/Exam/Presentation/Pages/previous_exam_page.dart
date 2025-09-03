import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre_details/exam_pre_details_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/question_card_pre.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/exam_navigation_bar.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../widgets/Exam_Previous/question_grid_dialog_pre.dart';

class PreviousExamPage extends StatefulWidget {
  final String nameExam;
  const PreviousExamPage({required this.nameExam, super.key});

  @override
  State<PreviousExamPage> createState() => _PreviousExamPageState();
}

class _PreviousExamPageState extends State<PreviousExamPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _openQuestionGridDialog(List<Map<String, dynamic>> allSubQuestions) {
    showDialog(
      context: context,
      builder:
          (context) => QuestionGridDialogPre(
            allSubQuestions: allSubQuestions,
            currentIndex: _currentPage,
            onSelect: (index) {
              setState(() {
                _currentPage = index;
                _pageController.jumpToPage(index);
              });
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.nameExam),
        backgroundColor: Colors.white,
      ),

      body: BlocBuilder<ExamPreDetailsCubit, ExamPreDetailsState>(
        builder: (context, state) {
          if (state is ExamPreDetailsLoading) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/Loading Dots Blue.json',
                repeat: true,
              ),
            );
          } else if (state is ExamPreDetailsSuccess) {
            final questions = state.examPreDetailsModel.questions;

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

            return PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: allSubQuestions.length,
              itemBuilder: (context, index) {
                final mainQuestion =
                    allSubQuestions[index]["main"] as QuestionPreModel;
                final subQuestion =
                    allSubQuestions[index]["sub"] as QuestionPreModel;

                return QuestionCardPre(
                  mainQuestion: mainQuestion,
                  subQuestion: subQuestion,
                );
              },
            );
          } else if (state is ExamPreDetailsFailure) {
            return Center(child: Text("حدث خطأ: ${state.errMsg}"));
          }

          return const SizedBox.shrink();
        },
      ),

      bottomNavigationBar:
          BlocBuilder<ExamPreDetailsCubit, ExamPreDetailsState>(
            builder: (context, state) {
              if (state is! ExamPreDetailsSuccess) {
                return const SizedBox.shrink();
              }

              final questions = state.examPreDetailsModel.questions;
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

              return ExamNavigationBar(
                currentPage: _currentPage,
                totalPages: allSubQuestions.length,
                onPrevious:
                    _currentPage > 0
                        ? () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        )
                        : null,
                onNext:
                    _currentPage < allSubQuestions.length - 1
                        ? () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linearToEaseOut,
                        )
                        : null,
                onOpenGrid: () => _openQuestionGridDialog(allSubQuestions),
              );
            },
          ),
    );
  }
}
