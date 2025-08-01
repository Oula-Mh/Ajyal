import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/perf_legend.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CourseAnalysis extends StatelessWidget {
  final double percent;
  const CourseAnalysis({super.key, required this.percent});
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
    final color = getColor(percent);
    final label = getLabel(percent);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
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
                            Text(
                              label,
                              style: TextStyle(
                                color: color,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CircularPercentIndicator(
                      animateFromLastPercent: true,
                      animation: true,
                      animationDuration:
                          1200, // بالميلي ثانية (مثلاً: 1.2 ثانية)
                      radius: 33.0,
                      lineWidth: 5.0,
                      percent: percent,
                      center: Text(
                        "% ${(percent * 100).toInt()}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: color,
                      backgroundColor: Colors.grey[200]!,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
                Divider(height: 22, color: Colors.grey.shade300),
                PerformanceLegend(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
