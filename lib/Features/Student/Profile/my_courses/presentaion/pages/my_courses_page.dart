import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/widgets/animated_course_card.dart';
import 'package:flutter/material.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  final List<MyCoursesModel> courses = [
    MyCoursesModel(
      name: "كورس صيفي – بكالوريا",
      startDate: "2025-08-01T09:00:00",
      endDate: "2025-08-20T18:00:00",
      section: "الشعبة A",
      scheduleImage: "assets/images/photo_2025-08-09_03-11-18.jpg",
    ),
    MyCoursesModel(
      name: "كورس شتوي – تاسع",
      startDate: "2025-01-10T09:00:00",
      endDate: "2025-02-20T18:00:00",
      section: "الشعبة B",
      scheduleImage: "assets/images/photo_2025-08-09_03-11-18.jpg",
    ),
    MyCoursesModel(
      name: "جلسات امتحانية – بكالوريا",
      startDate: "2025-08-05T09:00:00",
      endDate: "2025-08-30T18:00:00",
      section: "الشعبة C",
      scheduleImage: "assets/images/photo_2025-08-09_03-11-18.jpg",
    ),
    MyCoursesModel(
      name: "جلسات امتحانية – بكالوريا",
      startDate: "2025-08-05T09:00:00",
      endDate: "2025-08-30T18:00:00",
      section: "الشعبة C",
      scheduleImage: "assets/images/photo_2025-08-09_03-11-18.jpg",
    ),
  ];

  final List<Color> pastelColors = const [
    Color.fromARGB(255, 232, 251, 235),
    Color.fromARGB(255, 228, 242, 251),
    Color.fromARGB(255, 250, 233, 233),
    Color.fromARGB(255, 251, 248, 233),
  ];

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
        // backgroundColor: AppColor.primaryColor,
        backgroundColor: Colors.white,
        elevation: 0,
        //  foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final color = pastelColors[index % pastelColors.length];
          return AnimatedCourseCard(
            course: courses[index],
            backgroundColor: color,
            delay: index * 200,
          );
        },
      ),
    );
  }
}
