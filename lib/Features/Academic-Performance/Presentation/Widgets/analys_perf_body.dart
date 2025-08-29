import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/AllQuizzesCubit/all_quizz_cubit_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentAllMean/student_all_mean_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentAllStddev/student_all_stddev_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/analysis_tabbar.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/chart_widget.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/course_analysis.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/item_analys_selection.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/mean_widget.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/stddev_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysPerfBody extends StatefulWidget {
  final TabController controller;
  final bool showChart;
  final void Function()? onTap;
  const AnalysPerfBody({
    super.key,
    required this.controller,
    required this.showChart,
    required this.onTap,
  });

  @override
  State<AnalysPerfBody> createState() => _AnalysPerfBodyState();
}

class _AnalysPerfBodyState extends State<AnalysPerfBody> {
  int selectedSubjectId = 1; // أو قيمة أولية مناسبة

  void _onSubjectChanged(int subjectId) {
    setState(() {
      selectedSubjectId = subjectId;
    });

    // إعادة تحميل البيانات
    context.read<StudentAllMeanCubit>().getAverageBySubject(subjectId);
    context.read<StudentAllStddevCubit>().getStddevBySubject(subjectId);
    context.read<AllQuizzCubitCubit>().getQuizzesForAnalysis(subjectId);
  }

  @override
  void initState() {
    super.initState();
    _onSubjectChanged(selectedSubjectId); // تحميل مبدئي
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.87,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            CourseAnalysis(),
            ItemAnalysSelection(onSubjectChanged: _onSubjectChanged),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AnalysisTabbar(controller: widget.controller),
                  const SizedBox(height: 20),
                  Builder(
                    builder: (_) {
                      final currentTabIndex = widget.controller.index;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            color: const Color.fromRGBO(243, 248, 255, 1),
                            child: Column(
                              children: [
                                //========== المتوسط
                                MeanWidget(currentTabIndex: currentTabIndex),
                                //====== التباين
                                const SizedBox(height: 20),
                                StddevWidget(currentTabIndex: currentTabIndex),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                          //====== الاختبارات
                          const SizedBox(height: 24),
                          QuizListWidget(currentTabIndex: currentTabIndex),
                          const SizedBox(height: 24),
                          //====== الرسم البياني
                          ChartWidget(
                            showChart: widget.showChart,
                            onTap: widget.onTap,
                            currentTabIndex: currentTabIndex,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
