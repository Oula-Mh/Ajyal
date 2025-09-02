import 'package:flutter/material.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';

class ImageProgram extends StatelessWidget {
  final Course course;
  ImageProgram({required this.course});

  @override
  Widget build(BuildContext context) {
    final image =
        course.classroomCourses.isNotEmpty
            ? course.classroomCourses.first.image?.path
            : null;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child:
          image != null
              ? Image.network(image, fit: BoxFit.cover)
              : const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.image_not_supported, size: 80),
              ),
    );
  }
}
