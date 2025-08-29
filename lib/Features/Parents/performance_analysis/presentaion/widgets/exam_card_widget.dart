import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import '../../data/models/details_exam_parent_model.dart';

class ExamCardWidget extends StatelessWidget {
  final ExamParentModel exam;
  const ExamCardWidget({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.quizName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo",
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColor.purple,
                ),
                const SizedBox(width: 8),
                Text(
                  "التاريخ: ${exam.examDate}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: "Cairo",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 186, 151, 174),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "العلامة: ${exam.result ?? "-"} / ${exam.maxScore}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: "Cairo",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
