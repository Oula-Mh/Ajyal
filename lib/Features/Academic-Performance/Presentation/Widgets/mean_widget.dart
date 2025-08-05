import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentAllMean/student_all_mean_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/avg_performance_bar.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/percent_bar_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeanWidget extends StatelessWidget {
  final int currentTabIndex;
  const MeanWidget({super.key, required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentAllMeanCubit, StudentAllMeanState>(
      builder: (context, state) {
        if (state is StudentAllMeanLoading) {
          // ✅ Skeleton instead of CircularProgressIndicator
          return PercentBarSkelton(title: "متوسط الأداء:");
        } else if (state is StudentAllMeanSuccess) {
          final model = state.model;
          final average =
              currentTabIndex == 0
                  ? model.paperExam.averageScore
                  : currentTabIndex == 1
                  ? model.quiz.averageScore
                  : model.both;
          return AvgPerformanceBar(
            title: "متوسط الأداء:",
            value: average,
            isStddev: false,
          );
        } else if (state is StudentAllMeanFail) {
          return Center(child: Text("خطأ: ${state.errMessage}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
