import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/AllQuizzesCubit/all_quizz_cubit_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/chart.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/exam_chart_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartWidget extends StatelessWidget {
  final bool showChart;
  final void Function()? onTap;
  final int currentTabIndex;
  const ChartWidget({
    super.key,
    required this.showChart,
    required this.onTap,
    required this.currentTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white1,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: BlocBuilder<AllQuizzCubitCubit, AllQuizzCubitState>(
        builder: (context, state) {
          if (state is AllQuizzLoading) {
            return ExamCharSkelton(showChart: showChart);
          } else if (state is AllQuizzSuccess) {
            final model = state.model;
            final List<QuizItem> quizList =
                currentTabIndex == 0
                    ? model.paperExams
                    : currentTabIndex == 1
                    ? model.quiz
                    : model.both;
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      " مخطط لتوضيح درجاتك في الاختبارات : ",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                        fontSize: 14.5,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        showChart ? "إخفاء " : "إظهار",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                showChart
                    ? quizList.isEmpty
                        ? Container(
                          height: 250,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 25,
                          ),
                          child: Text(
                            "  لا يوجد اختبارات لعرضها",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                        : SizedBox(
                          height: 250,
                          child:
                              currentTabIndex == 2
                                  ? (model.paperExams.isEmpty ||
                                          model.quiz.isEmpty)
                                      ? Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 25,
                                        ),
                                        child: Text(
                                          "  لا يوجد اختبارات",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      )
                                      : Container()
                                  //: ExamLineChartBoth(quizList: model)
                                  : ExamLineChartPage(quizList: quizList),
                        )
                    : SizedBox(height: 70),
              ],
            );
          } else if (state is AllQuizzFail) {
            return Center(child: Text("خطأ: ${state.errMessage}"));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
