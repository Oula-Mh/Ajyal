import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:flutter/material.dart';

class AllCourseTitle extends StatelessWidget {
  final String title;
  final String date;
  const AllCourseTitle({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            height: 2,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.date_range, color: AppColor.primaryColor),
            SizedBox(width: 4),
            Text(
              formatDate(date),
              style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
