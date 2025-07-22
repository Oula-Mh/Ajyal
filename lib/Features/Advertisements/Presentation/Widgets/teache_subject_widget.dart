import 'package:ajyal/Features/Advertisements/Presentation/Widgets/text_skelton.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherSubject extends StatelessWidget {
  const TeacherSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectCubit, SubjectState>(
      builder: (context, state) {
        if (state is SubjectLoadedSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(state.subjects.length, (index) {
                final subject = state.subjects[index];
                return Text(
                  "- ${subject.name!} ( ${subject.type} )",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white60,
                    height: 1.8,
                  ),
                );
              }),
            ],
          );
        } else if (state is SubjectLoading) {
          return Center(child: TextSkeleton());
        } else {
          return Center(child: Text("لا توجد بيانات للعرض"));
        }
      },
    );
  }
}
