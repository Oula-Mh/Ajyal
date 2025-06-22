import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectPage extends StatelessWidget {
  SubjectPage({super.key});

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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[120],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: DropdownButton<String>(
                    value: cubit.selectedCourse,
                    underline: SizedBox(),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                      size: 37,
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      if (value != null) {
                        cubit.changeValue(value);
                        cubit.fetchSubjects(value);
                      }
                    },
                    items:
                        courses.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
                state is SubjectSubjectsLoaded
                    ? Expanded(
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
                    )
                    : Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
