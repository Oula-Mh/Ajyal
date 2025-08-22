import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/linked_student_list.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/link_student.dart';
import 'package:flutter/material.dart';

class StudentInfoCard extends StatelessWidget {
  final String studentName;
  final String studentClass;

  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.studentClass,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم الطالب والصف
            Text(
              "اسم الطالب : $studentName",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "الصف : $studentClass",
              style: const TextStyle(
                fontSize: 15,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                LinkedStudentList(),
                const SizedBox(width: 30),
                LinkStudent(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
