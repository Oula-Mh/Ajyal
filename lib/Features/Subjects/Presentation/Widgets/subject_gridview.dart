import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/subject_item.dart';
import 'package:flutter/material.dart';

class SubjectGridView extends StatelessWidget {
  final SubjectSubjectsLoaded state;
  const SubjectGridView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: state.subjects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 3.5,
        ),
        itemBuilder: (context, index) {
          final subject = state.subjects[index];
          final icon = getIconForSubject(subject);
          return SubjectCard(subject: subject, icon: icon);
        },
      ),
    );
  }
}
