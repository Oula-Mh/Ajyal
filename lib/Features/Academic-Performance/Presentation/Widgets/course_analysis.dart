import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repoimp.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentTotalMean/student_total_mean_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/circular_perecent_skelton.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/perf_legend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

class CourseAnalysis extends StatelessWidget {
  const CourseAnalysis({super.key});
  Color getColor(double value) {
    if (value <= 0.3) {
      return Colors.redAccent;
    } else if (value <= 0.6) {
      return Colors.orangeAccent;
    } else if (value <= 0.9) {
      return Colors.lightBlue;
    } else {
      return Colors.green;
    }
  }

  String getLabel(double value) {
    if (value <= 0.3) {
      return "ضعيف";
    } else if (value <= 0.6) {
      return "جيد";
    } else if (value <= 0.9) {
      return "جيد جداً";
    } else {
      return "ممتاز";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => StudentTotalMeanCubit(getit<AnalysisRepoimp>())
            ..getTotalMean(
              getit<CacheHelper>().getData(key: "selectedCourseId"),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: BlocBuilder<StudentTotalMeanCubit, StudentTotalMeanState>(
          builder: (context, state) {
            return Card(
              elevation: 2,
              child: Container(
                width: double.infinity,
                color: AppColor.white1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "متوسط درجاتك العام",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Text("المستوى :  "),
                                  state is StudentTotalMeanSuccess
                                      ? Text(
                                        getLabel(state.studentTotalMean / 100),
                                        style: TextStyle(
                                          color: getColor(
                                            state.studentTotalMean / 100,
                                          ),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                      : Shimmer.fromColors(
                                        baseColor: Colors.grey.shade400,
                                        highlightColor: AppColor.white1,
                                        child: Container(height: 10),
                                      ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          state is StudentTotalMeanSuccess
                              ? CircularPercentIndicator(
                                animateFromLastPercent: true,
                                animation: true,
                                animationDuration:
                                    1200, // بالميلي ثانية (مثلاً: 1.2 ثانية)
                                radius: 33.0,
                                lineWidth: 5.0,
                                percent: state.studentTotalMean / 100,
                                center: Text(
                                  "% ${(state.studentTotalMean).toInt()}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                progressColor: getColor(
                                  state.studentTotalMean / 100,
                                ),
                                backgroundColor: Colors.grey[200]!,
                                circularStrokeCap: CircularStrokeCap.round,
                              )
                              : CircularPercentSkeleton(),
                        ],
                      ),
                      Divider(height: 22, color: Colors.grey.shade300),
                      PerformanceLegend(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
