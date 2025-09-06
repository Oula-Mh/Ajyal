import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/bloc/parent_combine_mean/parent_combined_mean_cubit.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/%D8%A7ighlight_row.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/main_card_widget.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/shimmer_loading_widget.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/subject_chart_card_widget.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/view_details_card.dart';
import 'package:ajyal/Features/Parents/performance_analysis/utils/performance_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class StudentMarkAnalysis extends StatefulWidget {
//   const StudentMarkAnalysis({super.key});

//   @override
//   State<StudentMarkAnalysis> createState() => _StudentMarkAnalysisState();
// }

// class _StudentMarkAnalysisState extends State<StudentMarkAnalysis> {
//   @override
//   void initState() {
//     super.initState();
//     // final idStudent = getit<CacheHelper>().getData(key: "studentId");

//     context.read<ParentCombinedMeanCubit>().fetchAll(1, 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ParentCombinedMeanCubit, ParentCombinedMeanState>(
//       builder: (context, state) {
//         if (state is ParentCombinedMeanLoading) {
//           return const ShimmerLoadingWidget();
//         } else if (state is ParentCombinedMeanFailure) {
//           return Center(child: Text("خطأ: ${state.errMsg}"));
//         } else if (state is ParentCombinedMeanSuccess) {
//           final subjects = state.subjects;
//           final average = state.totalMean;
//           final performance = getPerformance(average);
//           final highlightCards = buildHighlightCards(subjects);

//           return Scaffold(
//             body: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   MainCardWidget(
//                     average: average,
//                     performance: performance.text,
//                     color: performance.color,
//                   ),
//                   const SizedBox(height: 18),
//                   SubjectChartCardWidget(subjects: subjects),
//                   const SizedBox(height: 16),
//                   if (highlightCards.isNotEmpty)
//                     HighlightCardsRow(highlightCards: highlightCards),
//                   const SizedBox(height: 16),
//                   ViewDetailsCard(subjects: subjects),
//                 ],
//               ),
//             ),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }
class StudentMarkAnalysis extends StatefulWidget {
  const StudentMarkAnalysis({super.key});

  @override
  State<StudentMarkAnalysis> createState() => _StudentMarkAnalysisState();
}

class _StudentMarkAnalysisState extends State<StudentMarkAnalysis> {
  @override
  void initState() {
    super.initState();

    context.read<ParentCombinedMeanCubit>().fetchAll(
      int.parse(getit<CacheHelper>().getData(key: "studentId")),
      getit<CacheHelper>().getData(key: "selectedCourseId"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    final padding = 16.0;

    return BlocBuilder<ParentCombinedMeanCubit, ParentCombinedMeanState>(
      builder: (context, state) {
        if (state is ParentCombinedMeanLoading) {
          return const ShimmerLoadingWidget();
        } else if (state is ParentCombinedMeanFailure) {
          return Scaffold(body: Center(child: Text("خطأ: ${state.errMsg}")));
        } else if (state is ParentCombinedMeanSuccess) {
          final subjects = state.subjects;
          final average = state.totalMean;
          final performance = getPerformance(average);
          final highlightCards = buildHighlightCards(subjects);

          return Scaffold(
            body: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MainCardWidget(
                    average: average,
                    performance: performance.text,
                    color: performance.color,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SubjectChartCardWidget(
                    subjects: subjects,
                    chartHeight: screenHeight * 0.3,
                  ),
                  if (highlightCards.isNotEmpty)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: HighlightCardsRow(
                        highlightCards: highlightCards,
                        cardWidth: screenWidth * 0.4,
                      ),
                    ),
                  ViewDetailsCard(subjects: subjects),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
