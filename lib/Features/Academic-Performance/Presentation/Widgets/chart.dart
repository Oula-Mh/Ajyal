import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExamLineChartPage extends StatelessWidget {
  final List<QuizItem> quizList;

  const ExamLineChartPage({super.key, required this.quizList});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyQuizData = List.generate(30, (index) {
      return {
        "id": index + 1,
        "curriculum_id": 1,
        "quiz_name": "Quiz for Curriculum ${index + 1}",
        "exam_date": "2025-07-${(index % 30 + 1).toString().padLeft(2, '0')}",
        "result": (5 + (index % 15)).toStringAsFixed(2),
        "max_score": 20,
      };
    });
    // final List<QuizItem> quizList =
    //     dummyQuizData.map((e) => QuizItem.fromJson(e)).toList();

    int maxScore = quizList.fold(
      0,
      (prev, e) => e.maxScore > prev ? e.maxScore : prev,
    );

    // نظري
    final quizSpots = List.generate(
      quizList.length,
      (index) => FlSpot(
        index.toDouble(),
        double.tryParse(quizList[index].result) ?? 0,
      ),
    );


    return Card(
      elevation: 5,
      child: InteractiveViewer(
        constrained: false,
        scaleEnabled: true,
        panEnabled: true,
        child: SizedBox(
          width: quizList.length * 40,
          height: 220,
          child: Padding(
            padding: const EdgeInsets.only(top: 17.5, right: 10),
            child: LineChart(
              LineChartData(
                minY: 0,
                maxY: maxScore + 10,
                gridData: FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 40,
                      getTitlesWidget:
                          (value, meta) => SideTitleWidget(
                            space: 8,
                            meta: meta,
                            child: Text(
                              '${value.toInt()}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < quizList.length) {
                          return SideTitleWidget(
                            space: 8,
                            meta: meta,
                            child: GestureDetector(
                              onTap: () {
                                print(quizList[index].quizName);
                              },
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      quizList.length,
                      (index) => FlSpot(
                        index.toDouble(),
                        double.parse(quizList[index].result),
                      ),
                    ),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
