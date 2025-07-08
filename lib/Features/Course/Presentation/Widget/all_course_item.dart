import 'package:ajyal/Features/Advertisements/Presentation/Bloc/adv/adv_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/all_course_image.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/all_course_title_widget.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/show_course_button.dart';
import 'package:flutter/material.dart';

class AllCourseItem extends StatelessWidget {
  final CourseAdvSuccess state;
  const AllCourseItem({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: ListView.builder(
        itemCount: state.model.data!.length,
        itemBuilder: (context, item) {
          final course = state.model.data![item];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 95,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFdcf5fc),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AllCourseImage(path: (course.images?[0].path ?? '')),
                      SizedBox(width: 15),

                      AllCourseTitle(
                        title: course.title ?? '',
                        date: course.createdAt.toString(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ShowCourseBttn(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
