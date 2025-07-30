import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:go_router/go_router.dart';

class PreviousExamCard extends StatelessWidget {
  final Map<String, dynamic> result;
  final Color Function(int) getColor;

  const PreviousExamCard({
    super.key,
    required this.result,
    required this.getColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.previousExamPage);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Card(
          color: AppColor.white1,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 18,
                          color: Color.fromARGB(255, 184, 138, 168),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          result['name'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text("10", style: const TextStyle(color: Colors.black45)),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 8.0,
                  percent: 0.1,
                  center: Text(
                    "${10}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: getColor(10),
                    ),
                  ),
                  progressColor: getColor(10),
                  backgroundColor: Colors.grey.shade200,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
