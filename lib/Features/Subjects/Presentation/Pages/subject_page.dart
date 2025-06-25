import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/course_dropdown.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/subject_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المواد الدراسية", style: Styles.largeWhite),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<SubjectCubit, SubjectState>(
          builder: (context, state) {
            var cubit = context.read<SubjectCubit>();
            return Column(
              children: [
                CourseDropDown(cubit: cubit),
                state is SubjectSubjectsLoaded
                    ? SubjectGridView(state: state)
                    : Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
