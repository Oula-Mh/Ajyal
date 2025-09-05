import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/all_course_title_widget.dart';
import 'package:ajyal/Features/Course/Presentation/Widget/show_course_button.dart';
import 'package:flutter/material.dart';

class AllCourseItem extends StatelessWidget {
  final int itemCount;
  final List<AdvModel> courses;
  final bool isGeneral;
  final bool isCourse;
  const AllCourseItem({
    super.key,
    required this.itemCount,
    required this.courses,
    required this.isGeneral,
    required this.isCourse,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, item) {
          final course = courses[item];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFdcf5fc),
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AllCourseTitle(
                              title: course.title!,
                              date: course.body!,
                              images: course.images!,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 5,
                            ),
                            child:
                                isGeneral
                                    ? ShowCourseBttn(
                                      images: course.images!,
                                      isGeneral: isGeneral,
                                      isCourse: isCourse,
                                    )
                                    : ShowCourseBttn(
                                      id: course.advertisableId!,
                                      images: course.images!,
                                      isGeneral: isGeneral,
                                      isCourse: isCourse,
                                    ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDate(course.createdAt!),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              formatTime(course.createdAt!),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
