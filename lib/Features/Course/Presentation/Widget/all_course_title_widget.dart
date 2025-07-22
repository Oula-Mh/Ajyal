import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/image_row.dart';
import 'package:flutter/material.dart';

class AllCourseTitle extends StatelessWidget {
  final String title;
  final String date;
  final List<Images> images;
  const AllCourseTitle({
    super.key,
    required this.title,
    required this.date,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: TextStyle(
            height: 2,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        // body
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Text(
            date,
            style: TextStyle(color: Colors.black, fontSize: 15),
            maxLines: null,
            overflow: TextOverflow.visible,
          ),
        ),

        // Row with images and button
        if (images.isNotEmpty) ImageRow(images: images),
      ],
    );
  }
}
