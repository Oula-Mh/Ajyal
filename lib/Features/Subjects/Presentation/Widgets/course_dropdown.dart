import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:flutter/material.dart';

class CourseDropDown extends StatelessWidget {
  final SubjectCubit cubit;
  const CourseDropDown({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[120],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: DropdownButton<String>(
        value: cubit.selectedCourse,
        borderRadius: BorderRadius.circular(18),
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey, size: 37),
        isExpanded: true,
        onChanged: (value) {
          if (value != null) {
            cubit.changeValue(value);
            cubit.fetchSubjects(value);
          }
        },
        items:
            courses.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
      ),
    );
  }
}
