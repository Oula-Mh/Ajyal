import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/AllQuizzesCubit/all_quizz_cubit_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/name_score_skelton.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/name_scroe_exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizListWidget extends StatelessWidget {
  final int currentTabIndex;
  const QuizListWidget({super.key, required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllQuizzCubitCubit, AllQuizzCubitState>(
      builder: (context, state) {
        if (state is AllQuizzLoading) {
          return NameAndScoreListSkeleton();
        } else if (state is AllQuizzSuccess) {
          final model = state.model;
          final List<QuizItem> quizList =
              currentTabIndex == 0
                  ? model.paperExams
                  : currentTabIndex == 1
                  ? model.quiz
                  : model.both;
          return NameAndScoreList(quizList: quizList);
        } else if (state is AllQuizzFail) {
          return Center(child: Text("خطأ: ${state.errMessage}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
