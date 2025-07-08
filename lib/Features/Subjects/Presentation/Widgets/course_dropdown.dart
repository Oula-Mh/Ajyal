import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDropDown extends StatelessWidget {
  const CourseDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    List<CourseModel> myAllcourses = [];
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state is CourseSuccess) {
          myAllcourses = state.allcourses;
        }
      },
      builder: (context, state) {
        final cubit = CourseCubit.get(context);
        return getit<CacheHelper>().getData(key: "selectedCourseId") != null
            ? Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.grey[120],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: DropdownButton<CourseModel>(
                value: cubit.selectedCourse,
                isExpanded: true,
                underline: SizedBox(),
                icon: Icon(Icons.arrow_drop_down, size: 30),
                onChanged: (CourseModel? value) {
                  if (value != null) {
                    cubit.changeCourse(value, context);
                  }
                },

                items:
                    myAllcourses.map((course) {
                      return DropdownMenuItem<CourseModel>(
                        value: course,
                        child: Text(course.name),
                      );
                    }).toList(),
              ),
            )
            : Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.grey[120],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Text("data"),
            );
      },
    );
  }
}
