import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/course_dropdown.dart';
import 'package:ajyal/Features/Subjects/Presentation/Widgets/subject_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  void initState() {
    super.initState();
    print("😎 ===== ${getit<CacheHelper>().getData(key: "selectedCourseId")}");
    Future.microtask(() async {
      final courseCubit = context.read<CourseCubit>();
      await courseCubit.getAllCourse();

      final selected = courseCubit.selectedCourse;
      if (selected != null && mounted) {
        context.read<SubjectCubit>().fetchSubjects(selected.id);
      }
    });
  }

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
        child: Column(
          children: [
            CourseDropDown(),
            BlocBuilder<SubjectCubit, SubjectState>(
              builder: (context, subjectState) {
                if (subjectState is SubjectLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (subjectState is SubjectLoadedSuccess) {
                  return SubjectGridView(state: subjectState);
                } else if (subjectState is SubjectError) {
                  return Center(child: Text("فشل تحميل المواد"));
                } else {
                  return Center(child: Text("انتظر تحميل المواد..."));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
