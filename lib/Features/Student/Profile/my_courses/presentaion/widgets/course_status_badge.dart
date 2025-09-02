
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:flutter/material.dart';

class CourseStatusBadge extends StatelessWidget {
  final Course course;

  const CourseStatusBadge({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startDate = DateTime.tryParse(course.startDate) ?? now;
    final endDate = DateTime.tryParse(course.endDate) ?? now;

    String statusText;
    Color badgeColor;

    if (now.isBefore(startDate)) {
      statusText = "لم يبدأ بعد";
      badgeColor = Colors.orange.shade400;
    } else if (now.isAfter(endDate)) {
      statusText = "منتهي";
      badgeColor = Colors.red.shade400;
    } else {
      statusText = "جاري الآن";
      badgeColor = Colors.green.shade400;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: const TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}
