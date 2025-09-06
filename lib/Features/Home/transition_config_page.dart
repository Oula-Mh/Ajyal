import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TransitionConfigPage extends StatelessWidget {
  const TransitionConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white1,
      body: BlocProvider(
        create:
            (context) => CourseCubit(
              getit<CourseRepoimp>(),
            )..getAllCourse(getit<CacheHelper>().getData(key: "studentIdbase")),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// أيقونة النجاح
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: AppColor.primaryColor,
                    size: 100,
                  ),
                ),
                const SizedBox(height: 30),

                /// النص الأساسي
                Text(
                  "تم تسجيل دخولك بنجاح 🎉",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                /// النص الفرعي
                Text(
                  "يمكنك الآن متابعة رحلتك التعليمية ضمن التطبيق والاستفادة من الخدمات المقدمة .",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),

                /// BlocConsumer لحفظ الكورس والزر
                BlocConsumer<CourseCubit, CourseState>(
                  listener: (context, state) {
                    if (state is CourseSuccess) {
                      List<CourseModel> list = state.allcourses;

                      final selectedCourse = list[0];
                      getit<CacheHelper>().saveData(
                        key: "selectedCourseId",
                        value: selectedCourse.id,
                      );
                      getit<CacheHelper>().saveData(
                        key: "selectedCourseName",
                        value: selectedCourse.name,
                      );
                    } else if (state is CourseFail) {
                      customAlert(context, state.errMsg, () {
                        Navigator.of(context).pop();
                      });
                    } else if (state is CourseInitial ||
                        state is CourseLoading) {
                      // ممكن نخلي اللودينغ ضمن الـ builder فقط
                    } else {
                      customAlert(context, "Something wrong happen", () {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is CourseSuccess) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.homePage);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "الانتقال للصفحة الرئيسية",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
