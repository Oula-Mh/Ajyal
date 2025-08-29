import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/exam_card_widget.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/exam_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/details_exam_parent/details_exam_parent_cubit.dart';

class ExamList extends StatelessWidget {
  final String selectedType;
  const ExamList({super.key, required this.selectedType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsExamParentCubit, DetailsExamParentState>(
      builder: (context, state) {
        if (state is DetailsExamParentLoading) {
          return const ExamShimmerWidget();
        } else if (state is DetailsExamParentSuccess) {
          final exams =
              selectedType == "كتابي"
                  ? state.examDetailsParentModel.paperExams
                  : state.examDetailsParentModel.quizzes;

          if (exams.isEmpty) {
            return const Center(
              child: Text(
                "لا يوجد امتحانات لهذا النوع",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: exams.length,
            itemBuilder: (context, index) => ExamCardWidget(exam: exams[index]),
          );
        } else if (state is DetailsExamParentFailure) {
          return Center(
            child: Text(
              state.errMsg,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
