import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectCoursePage extends StatefulWidget {
  final String id;
  final bool isParent;
  bool isItNull = false;
  SelectCoursePage({super.key, required this.id, required this.isParent});

  @override
  State<SelectCoursePage> createState() => _SelectCoursePageState();
}

class _SelectCoursePageState extends State<SelectCoursePage> {
  int? selectedCourseId;

  @override
  void initState() {
    super.initState();
    selectedCourseId = getit<CacheHelper>().getData(key: "selectedCourseId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create:
            (context) =>
                CourseCubit(getit<CourseRepoimp>())..getAllCourse(widget.id),
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
                  borderRadius: const BorderRadius.only(
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
                      const Text(
                        "قم باختيار الكورس المناسب لتكمل رحلتك التعليمة ضمن هذا الكورس",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                          height: 2,
                        ),
                      ),

                      const SizedBox(height: 30),
                      BlocBuilder<CourseCubit, CourseState>(
                        builder: (context, state) {
                          if (state is CourseSuccess &&
                              selectedCourseId != null) {
                            final currentCourse = state.allcourses.firstWhere(
                              (course) => course.id == selectedCourseId,
                              orElse: () => state.allcourses.first,
                            );
                            return Text(
                              "الكورس الحالي : ${currentCourse.name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.purple,
                                fontSize: 15,
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<CourseCubit, CourseState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is CourseSuccess) {
                            final courses = state.allcourses;

                            return Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: courses.length,
                                      separatorBuilder:
                                          (context, index) =>
                                              const SizedBox(height: 16),
                                      itemBuilder: (context, index) {
                                        final course = courses[index];
                                        bool isSelected =
                                            course.id == selectedCourseId;

                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                            horizontal: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color:
                                                  isSelected
                                                      ? AppColor.purple
                                                      : AppColor.primaryColor,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 5,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
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
                                              Checkbox(
                                                value: isSelected,
                                                activeColor: AppColor.purple,
                                                onChanged: (value) async {
                                                  setState(() {
                                                    selectedCourseId =
                                                        course.id;
                                                    widget.isItNull =
                                                        !widget.isItNull;
                                                  });
                                                  await getit<CacheHelper>()
                                                      .saveData(
                                                        key: "selectedCourseId",
                                                        value: course.id,
                                                      );
                                                  await getit<CacheHelper>()
                                                      .saveData(
                                                        key:
                                                            "selectedCourseName",
                                                        value: course.name,
                                                      );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 50,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (selectedCourseId != null) {
                                        !widget.isParent
                                            ? GoRouter.of(
                                              context,
                                            ).push(AppRouter.homePage)
                                            : GoRouter.of(
                                              context,
                                            ).push(AppRouter.parentHome);
                                        // أو للتوجه مباشرة للـ Home:
                                        // GoRouter.of(context).push(AppRouter.homePage);
                                      } else {
                                        // setState(() {
                                        //   widget.isItNull = !widget.isItNull;
                                        // });
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "اختر كورس من أجل متابعة الطالب",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            backgroundColor: Colors.grey,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      "تم",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          if (state is CourseFail) {
                            return const Center(
                              child: Text("فشل تحميل الكورسات"),
                            );
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
