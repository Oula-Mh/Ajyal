import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_Adv/course_adv_cubit.dart';
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
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFdcf5fc),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AllCourseTitle(
                      title: course.title ?? '',
                      date: course.body!,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ShowCourseBttn(
                      id: course.advertisableId!,
                      images: course.images!,
                    ),
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
