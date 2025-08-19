import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:go_router/go_router.dart';
import 'course_status_badge.dart';

class CourseCard extends StatelessWidget {
  final MyCoursesModel course;
  final Color backgroundColor;

  const CourseCard({
    super.key,
    required this.course,
    required this.backgroundColor,
  });

  void _showScheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            insetPadding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(course.scheduleImage, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "برنامج الكورس: ${course.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("إغلاق", style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [CourseStatusBadge(course: course)]),
          const SizedBox(height: 14),
          Text(
            course.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "الشعبة: ${course.section}",
            style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.black87),
              onPressed: () => _showScheduleDialog(context),
              icon: const Icon(Icons.calendar_today, size: 18),
              label: const Text(
                "عرض البرنامج",
                style: TextStyle(fontSize: 15, color: AppColor.primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.paymentsPage);
                },
                child: const Text(
                  "دفع الفواتير",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "تفاصيل أكثر",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
