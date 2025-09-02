import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExamLineChartBoth extends StatelessWidget {
  final AllQuizzesModel quizList;

  const ExamLineChartBoth({super.key, required this.quizList});

  @override
  Widget build(BuildContext context) {
    int maxScore = quizList.both.fold(
      0,
      (prev, e) => e.maxScore > prev ? e.maxScore : prev,
    );

    // 🟢 نظري (Quizzes)
    final quizSpots = List.generate(
      quizList.quiz.length,
      (index) => FlSpot(index.toDouble(), quizList.quiz[index].result),
    );

    // 📘 كتابي (Paper Exams) – تفترض وجود بيانات خاصة بها. نستخدم هنا maxScore كنموذج
    final paperSpots = List.generate(
      quizList.paperExams.length,
      (index) => FlSpot(
        index.toDouble(),
        quizList.paperExams[index].maxScore.toDouble(),
      ),
    );

    // 🟣 كليهما – متوسط بين quiz و paper
    final bothSpots = List.generate(quizList.both.length, (index) {
      final quiz = quizList.quiz[index].result;
      final paper = quizList.paperExams[index].maxScore.toDouble();
      return FlSpot(index.toDouble(), (quiz + paper) / 2);
    });

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ✅ وسيلة الإيضاح (Legend)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem(color: Colors.blue, label: 'الكتابي'),
              const SizedBox(width: 16),
              _buildLegendItem(color: Colors.green, label: 'النظري'),
              const SizedBox(width: 16),
              _buildLegendItem(color: Colors.purple, label: 'كليهما'),
            ],
          ),
          const SizedBox(height: 16),
          // ✅ المخطط البياني
          AspectRatio(
            aspectRatio: 1.6,
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
                        if (index >= 0 && index < quizList.both.length) {
                          return SideTitleWidget(
                            space: 8,
                            meta: meta,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: 12),
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
                  // 📘 كتابي
                  LineChartBarData(
                    spots: paperSpots,
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                  // 🟢 نظري
                  LineChartBarData(
                    spots: quizSpots,
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                  // 🟣 كليهما
                  LineChartBarData(
                    spots: bothSpots,
                    isCurved: true,
                    color: Colors.purple,
                    barWidth: 3,
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ ويدجت لبناء عنصر في الـ Legend
  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
