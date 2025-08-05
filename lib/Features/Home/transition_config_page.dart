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
      body: BlocProvider(
        create:
            (context) => CourseCubit(getit<CourseRepoimp>())..getAllCourse(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Blorf zanta keplin druv Mokta vreen ziblo charn Wexin plord nubra tek",
                ),
                SizedBox(height: 40),
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
                    } else {
                      customAlert(context, "Something wrong happen", () {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  builder: (context, state) {
                    return state is CourseSuccess
                        ? MaterialButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.homePage);
                          },
                          color: AppColor.primaryColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('الانتقال'),
                        )
                        : Center(child: CircularProgressIndicator());
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
