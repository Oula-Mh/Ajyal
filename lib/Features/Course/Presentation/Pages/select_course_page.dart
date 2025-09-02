import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectCoursePage extends StatelessWidget {
  const SelectCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => CourseCubit(getit<CourseRepoimp>())..getAllCourse(),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF17284B),
                  Color(0xFF17284B),
                  Color(0xFF365EB1),
                ],
                stops: [0.0, 0.75, 1.0],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height / 1.1,
                decoration: BoxDecoration(
                  color: AppColor.white1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "قم باختيار الكورس المناسب لتكمل رحلتك التعليمة ضمن هذا الكورس",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                          height: 2,
                        ),
                      ),
                      SizedBox(height: 50),
                      BlocConsumer<CourseCubit, CourseState>(
                        listener: (context, state) {
                          if (state is CourseSuccess) {
                            List<CourseModel> list = state.allcourses;
                          }
                        },
                        builder: (context, state) {
                          if (state is CourseSuccess) {
                            final courses = state.allcourses;

                            return Expanded(
                              child: ListView.separated(
                                itemCount: courses.length,
                                separatorBuilder:
                                    (context, index) =>
                                        const SizedBox(height: 16),
                                itemBuilder: (context, index) {
                                  final course = courses[index];
                                  return InkWell(
                                    onTap: () async {
                                      // حفظ البيانات
                                      await getit<CacheHelper>().saveData(
                                        key: "selectedCourseId",
                                        value: course.id,
                                      );
                                      await getit<CacheHelper>().saveData(
                                        key: "selectedCourseName",
                                        value: course.name,
                                      );
                                      GoRouter.of(
                                        context,
                                      ).push(AppRouter.homePage);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.book,
                                            color: AppColor.primaryColor,
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              course.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.check,
                                            size: 19,
                                            color: AppColor.primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }

                          if (state is CourseFail) {
                            return Center(child: Text("فشل تحميل الكورسات "));
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
