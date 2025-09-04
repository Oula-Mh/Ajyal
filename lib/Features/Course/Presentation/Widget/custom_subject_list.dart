import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Course/Data/Model/course_details_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSubjectList extends StatefulWidget {
  final Curriculums model;

  const CustomSubjectList({super.key, required this.model});

  @override
  State<CustomSubjectList> createState() => _CustomSubjectListState();
}

class _CustomSubjectListState extends State<CustomSubjectList> {
  bool showTeachers = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border(bottom: BorderSide(), right: BorderSide()),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Text(
                    "${widget.model.subject!.name!} : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  Text(
                    widget.model.subject!.description! ?? "لا يوحد وصف  للمادة",
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  showTeachers = !showTeachers;
                });
              },
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                alignment: Alignment.center,
                child: Icon(
                  showTeachers
                      ? Icons.keyboard_arrow_up_sharp
                      : Icons.keyboard_arrow_down_sharp,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        if (showTeachers)
          ...widget.model.teachers!.asMap().entries.map((entry) {
            int index = entry.key;
            var teacher = entry.value;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.grey),
                  Text(
                    " الأستاذ ${index + 1} : ",
                    style: TextStyle(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.teacherInfoPage, extra: teacher.id);
                    },
                    child: Text(
                      "${teacher.name} ",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }
}
