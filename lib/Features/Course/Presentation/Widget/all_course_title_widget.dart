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
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Text(
            date,
            style: TextStyle(color: Colors.black, fontSize: 15),
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
