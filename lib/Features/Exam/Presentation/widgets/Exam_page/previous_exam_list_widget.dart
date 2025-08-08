import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre/exam_pre_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/previous_exam_card.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviousExamListWidget extends StatelessWidget {
  const PreviousExamListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamPreCubit, ExamPreState>(
      builder: (context, state) {
        if (state is ExamPreSuccess) {
          final exams = state.examPreModel;
          if (exams.isEmpty) {
            return const Center(
              child: Text(
                "لا توجد نتائج لهذه المادة.",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "النتائج الأخيرة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "${_calculateAverage(exams)}%",
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    return PreviousExamCard(result: exams[index]);
                  },
                ),
              ),
            ],
          );
        } else if (state is ExamPreFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  int _calculateAverage(List<ExamPreModel> results) {
    if (results.isEmpty) return 0;
    double total = results.fold(
      0.0,
      (sum, item) => sum + (item.studentQuiz.result ?? 0),
    );
    return (total / results.length).round();
  }
}
