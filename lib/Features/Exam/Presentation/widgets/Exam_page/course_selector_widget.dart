import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseSelectorWidget extends StatefulWidget {
  final Function(String) onCourseSelected;

  const CourseSelectorWidget({super.key, required this.onCourseSelected});

  @override
  State<CourseSelectorWidget> createState() => _CourseSelectorWidgetState();
}

class _CourseSelectorWidgetState extends State<CourseSelectorWidget> {
  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().getAllCourse(
      getit<CacheHelper>().getData(key: "studentIdbase"),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    List<CourseModel> myAllcourses = [];

    return BlocListener<SubjectCubit, SubjectState>(
      listener: (context, state) {
        if (state is SubjectLoadedSuccess) {
          Navigator.pop(context); // نغلق الـ BottomSheet فقط بعد تحميل المواد
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "اختر الكورس",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            BlocConsumer<CourseCubit, CourseState>(
              listener: (context, state) {
                if (state is CourseSuccess) {
                  myAllcourses = state.allcourses;
                }
              },
              builder: (context, state) {
                return state is CourseLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                      child:
                          !isLoading
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                itemCount: myAllcourses.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: ListTile(
                                      leading: const Icon(Icons.book),
                                      title: Text(myAllcourses[index].name),
                                      onTap: () {
                                        context
                                            .read<CourseCubit>()
                                            .changeCourse(
                                              myAllcourses[index],
                                              context,
                                            );
                                        widget.onCourseSelected(
                                          myAllcourses[index].id.toString(),
                                        );
                                        setState(() {
                                          isLoading = true;
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
