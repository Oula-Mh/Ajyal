import 'dart:async';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current_details/exam_current_details_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/question_card_current.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/question_grid_dialog_current.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/submit_button.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/timer_circle.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/exam_navigation_bar.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:ajyal/Features/Exam/utils/question_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExamCurrentPage extends StatefulWidget {
  final int totalTime;
  final int initialTime;

  ExamCurrentPage({
    Key? key,
    required this.totalTime,
    required this.initialTime,
  }) : super(key: key);

  @override
  _ExamCurrentPageState createState() => _ExamCurrentPageState();
}

class _ExamCurrentPageState extends State<ExamCurrentPage>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? timer;
  late int totalTime;
  late int timeLeft;
  late AnimationController _controller;

  bool _examEnded = false;

  @override
  void initState() {
    super.initState();
    totalTime = widget.totalTime;
    timeLeft = widget.initialTime.clamp(0, totalTime);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: totalTime),
    )..forward(from: 1 - timeLeft / totalTime);

    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        endExam();
      }
    });
  }

  void endExam() {
    if (_examEnded) return;
    _examEnded = true;

    final state = context.read<ExamCurrentDetailsCubit>().state;
    if (state is ExamCurrentDetailsSuccess) {
      final model = state.examCurrentDetailsModel;
      GoRouter.of(context).go(AppRouter.submitExamPage, extra: model);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  Color getTimerColor() {
    if (timeLeft <= 30) return Colors.red;
    if (timeLeft <= 60) return Colors.orange;
    return const Color.fromARGB(255, 184, 138, 168);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showConfirmDialog(
          context: context,
          title: "تأكيد الخروج",
          content: "هل تريد إنهاء الامتحان والخروج؟",
          confirmText: "نعم",
          cancelText: "لا",
        );

        if (shouldExit) {
          endExam();
        }
        return false; // منع الرجوع الافتراضي
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                  right: 25,
                  left: 25,
                  top: 25,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubmitButton(onConfirmed: endExam),

                        TimerCircle(
                          controller: _controller,
                          timeLeft: timeLeft,
                          getTimerColor: getTimerColor,
                          formatTime: formatTime,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "اختبار بحث المتتاليات",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<
                  ExamCurrentDetailsCubit,
                  ExamCurrentDetailsState
                >(
                  builder: (context, state) {
                    if (state is ExamCurrentDetailsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ExamCurrentDetailsSuccess) {
                      final questions = state.examCurrentDetailsModel.questions;
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
                        onPageChanged:
                            (index) => setState(() => _currentPage = index),
                        itemCount: allSubQuestions.length,
                        itemBuilder: (context, index) {
                          final main =
                              allSubQuestions[index]["main"]
                                  as QuestionCurrentModel;
                          final sub =
                              allSubQuestions[index]["sub"]
                                  as QuestionCurrentModel;

                          return SingleChildScrollView(
                            padding: const EdgeInsets.all(25.0),
                            child: QuestionCardCurrent(
                              main: main,
                              sub: sub,
                              timeLeft: timeLeft,
                              onOptionSelected: (selectedIndex) {
                                setState(() {
                                  sub.userSelectedIndex = selectedIndex;
                                });
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is ExamCurrentDetailsFailure) {
                      return Center(child: Text("حدث خطأ: ${state.errMsg}"));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar:
            BlocBuilder<ExamCurrentDetailsCubit, ExamCurrentDetailsState>(
              builder: (context, state) {
                if (state is! ExamCurrentDetailsSuccess) {
                  return const SizedBox.shrink();
                }

                final questions = state.examCurrentDetailsModel.questions;
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
                  onOpenGrid: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return QuestionGridDialogCurrent(
                          allSubQuestions: allSubQuestions,
                          currentPage: _currentPage,
                          pageController: _pageController,
                        );
                      },
                    );
                  },
                );
              },
            ),
      ),
    );
  }
}
