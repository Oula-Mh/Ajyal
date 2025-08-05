import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExamLineChartPage extends StatelessWidget {
  final List<QuizItem> quizList;

  const ExamLineChartPage({super.key, required this.quizList});

  @override
  Widget build(BuildContext context) {
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

    //
    final paperSpots = List.generate(
      quizList.length,
      (index) => FlSpot(index.toDouble(), quizList[index].maxScore.toDouble()),
    );

    //
    final bothSpots = List.generate(quizList.length, (index) {
      final quiz = double.tryParse(quizList[index].result) ?? 0;
      final paper = quizList[index].maxScore.toDouble();
      return FlSpot(index.toDouble(), (quiz + paper) / 2);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: maxScore + 20,
          gridData: FlGridData(show: true),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                reservedSize: 40,
                getTitlesWidget:
                    (value, meta) => SideTitleWidget(
                      space: 8,
                      meta: meta,
                      child: Text('${value.toInt()}'),
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
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
    );
  }
}
