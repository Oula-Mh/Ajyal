import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/Bloc/my_courses/my_courses_cubit.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/animated_course_card.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/course_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  final List<Color> pastelColors = const [
    Color.fromARGB(255, 228, 242, 251),
    Color.fromARGB(255, 250, 233, 233),
    Color.fromARGB(255, 251, 248, 233),
  ];

  @override
  void initState() {
    super.initState();
    context.read<MyCoursesCubit>().getMyCoursesDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "كورساتي",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<MyCoursesCubit, MyCoursesState>(
        builder: (context, state) {
          if (state is MyCoursesLoading) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 1,
              itemBuilder: (context, index) => const CourseCardShimmer(),
            );
          } else if (state is MyCoursesFailure) {
            return Center(child: Text("خطأ: ${state.errMsg}"));
          } else if (state is MyCoursesSuccess) {
            final courses = state.myCoursesModel.data;

            if (courses.isEmpty) {
              return const Center(child: Text("لا توجد كورسات"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final color = pastelColors[index % pastelColors.length];
                final course = courses[index];

                return AnimatedCourseCard(
                  course: course,
                  backgroundColor: color,
                  delay: index * 200,
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
