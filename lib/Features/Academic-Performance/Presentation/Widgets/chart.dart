import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExamLineChartPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const ExamLineChartPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxScore = data
        .map((e) => e['score'] as double)
        .reduce((a, b) => a > b ? a : b);

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
                  if (index >= 0 && index < data.length) {
                    return SideTitleWidget(
                      space: 8,
                      meta: meta,
                      child: GestureDetector(
                        onTap: () {
                          print(data[index]['name']);
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
                data.length,
                (index) => FlSpot(index.toDouble(), data[index]['score']),
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
