import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/Home/Data/models/parent_student_model.dart';
import 'package:flutter/material.dart';

class SingleStudentItem extends StatelessWidget {
  final ParentStudentModel student;

  const SingleStudentItem({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: AppColor.secondaryColor, width: 2),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              "الطالب  : ${student.firstName} ${student.lastName}",
              style: TextStyle(height: 1.5, color: AppColor.primaryColor),
            ),
            subtitle: Text(
              "الصف : ${student.classLevel}",
              style: TextStyle(height: 2, color: AppColor.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
