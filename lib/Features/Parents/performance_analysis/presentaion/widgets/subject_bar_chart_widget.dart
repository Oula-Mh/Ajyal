import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/subject_mean_parent_model.dart';

class SubjectBarChartWidget extends StatelessWidget {
  final List<SubjectMeanParentModel> subjects;

  const SubjectBarChartWidget({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups:
            subjects.map((subject) {
              List<Color> gradientColors = [
                AppColor.primaryColor,
                AppColor.gradientLight,
                AppColor.secondaryColor,
              ];
              return BarChartGroupData(
                x: subjects.indexOf(subject),
                barRods: [
                  BarChartRodData(
                    toY: subject.mean,
                    width: 18,
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ],
              );
            }).toList(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget:
                  (value, meta) =>
                      value % 20 == 0
                          ? Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 11),
                          )
                          : const SizedBox.shrink(),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < subjects.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Transform.rotate(
                      angle: -0.6,
                      child: Text(
                        subjects[index].name,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
      ),
    );
  }
}
