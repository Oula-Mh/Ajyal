import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current/exam_current_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/current_exam_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CurrentExamListWidget extends StatelessWidget {
  const CurrentExamListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCurrentCubit, ExamCurrentState>(
      builder: (context, state) {
        if (state is ExamCurrentSuccess) {
          final exams = state.examCurrentModel;
          if (exams.isEmpty) {
            return const Center(
              child: Text(
                "لا يوجد امتحانات قادمة",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];
              return CurrentExamCard(
                exam: exam,
                onStartExam: () {
                  GoRouter.of(context).push(
                    AppRouter.examCurrentPage,
                    extra: {
                      'id': exam.id,
                      'initialTime':
                          exam.durationMinutes * 60 -
                          DateTime.now().difference(exam.startTime).inSeconds,
                      'totalTime': exam.durationMinutes * 60,
                      'name': exam.name,
                    },
                  );
                },
              );
            },
          );
        } else if (state is ExamCurrentFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
