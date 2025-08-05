import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentAllStddev/student_all_stddev_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/avg_performance_bar.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/percent_bar_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StddevWidget extends StatelessWidget {
  final int currentTabIndex;
  const StddevWidget({super.key, required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentAllStddevCubit, StudentAllStddevState>(
      builder: (context, state) {
        if (state is StudentAllStddevLoading) {
          // ✅ Skeleton instead of CircularProgressIndicator
          return PercentBarSkelton(title: " مدى تباين درجاتك:");
        } else if (state is StudentAllStddevSuccess) {
          final model = state.model;
          final value =
              currentTabIndex == 0
                  ? model.paperExam
                  : currentTabIndex == 1
                  ? model.quiz
                  : model.both;
          return AvgPerformanceBar(
            title: " مدى تباين درجاتك:",
            value: value!,
            isStddev: true,
          );
        } else if (state is StudentAllStddevFail) {
          return Center(child: Text("خطأ: ${state.errMessage}"));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
