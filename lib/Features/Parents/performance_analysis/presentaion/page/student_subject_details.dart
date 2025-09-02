import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/exam_list.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/filter_buttons.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/student_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details_exam_parent/details_exam_parent_cubit.dart';

class StudentSubjectDetailsPage extends StatefulWidget {
  final List<SubjectMeanParentModel> subjects;
  const StudentSubjectDetailsPage({super.key, required this.subjects});

  @override
  State<StudentSubjectDetailsPage> createState() =>
      _StudentSubjectDetailsPageState();
}

class _StudentSubjectDetailsPageState extends State<StudentSubjectDetailsPage>
    with SingleTickerProviderStateMixin {
  String selectedType = "كتابي";
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.subjects.length, vsync: this);
    _tabController.addListener(_onTabChanged);
    if (widget.subjects.isNotEmpty) {
      _fetchMarks(widget.subjects.first.id);
    }
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    _fetchMarks(widget.subjects[_tabController.index].id);
  }

  final idStudent = getit<CacheHelper>().getData(key: "studentId");

  void _fetchMarks(int subjectId) {
    context.read<DetailsExamParentCubit>().getMarks(
      idStudent: int.parse(idStudent),
      idSubject: subjectId,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.subjects.length,
      child: Scaffold(
        backgroundColor: AppColor.white1,
        appBar: StudentAppBar(
          tabController: _tabController,
          subjects: widget.subjects,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            FilterButtons(
              selectedType: selectedType,
              onChanged: (type) => setState(() => selectedType = type),
            ),
            const SizedBox(height: 20),
            Expanded(child: ExamList(selectedType: selectedType)),
          ],
        ),
      ),
    );
  }
}
