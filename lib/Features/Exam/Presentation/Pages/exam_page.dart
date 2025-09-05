// import 'package:ajyal/Core/styles/app_color.dart';
// import 'package:ajyal/Core/styles/app_text_style.dart';
// import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current/exam_current_cubit.dart';
// import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre/exam_pre_cubit.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/current_exam_list_widget.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/exam_type_tab_bar.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/previous_exam_list_widget.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/subject_selector_bar_Shimmer.dart';
// import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
// import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../widgets/Exam_page/subject_selector_bar.dart';

// class ExamPage extends StatefulWidget {
//   const ExamPage({super.key});

//   @override
//   State<ExamPage> createState() => _ExamPageState();
// }

// class _ExamPageState extends State<ExamPage> {
//   int selectedGradeIndex = 0;
//   int selectedTabIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//     context.read<ExamPreCubit>().getExamPre(id: selectedGradeIndex + 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 229, 238, 246),
//       appBar: AppBar(
//         title: Text("الإختبارات", style: Styles.largeWhite),
//         centerTitle: true,
//         backgroundColor: AppColor.primaryColor,
//       ),
//       body: Column(
//         children: [
//           ExamTypeTabBar(
//             selectedTabIndex: selectedTabIndex,
//             onTabSelected: (index) {
//               setState(() => selectedTabIndex = index);
//               if (index == 0) {
//                 context.read<ExamPreCubit>().getExamPre(
//                   id: selectedGradeIndex + 1,
//                 );
//               } else if (index == 1) {
//                 context.read<ExamCurrentCubit>().getExamCurrent(
//                   id: selectedGradeIndex + 1,
//                 );
//               }
//             },
//           ),

//           BlocBuilder<SubjectCubit, SubjectState>(
//             builder: (context, state) {
//               return state is SubjectLoadedSuccess
//                   ? SubjectSelectorBar(
//                     subjects: state.subjects,
//                     selectedIndex: selectedGradeIndex,
//                     onSubjectSelected: (index) {
//                       setState(() => selectedGradeIndex = index);

//                       if (selectedTabIndex == 0) {
//                         context.read<ExamPreCubit>().getExamPre(
//                           id: state.subjects[index].id!,
//                         );
//                       } else {
//                         context.read<ExamCurrentCubit>().getExamCurrent(
//                           id: state.subjects[index].id!,
//                         );
//                       }
//                     },
//                   )
//                   : SubjectSelectorBarShimmer();
//             },
//           ),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               margin: const EdgeInsets.all(16),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child:
//                   selectedTabIndex == 0
//                       ? PreviousExamListWidget()
//                       : CurrentExamListWidget(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current/exam_current_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre/exam_pre_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/current_exam_list_widget.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/exam_type_tab_bar.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/previous_exam_list_widget.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/subject_selector_bar_Shimmer.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/Exam_page/subject_selector_bar.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int selectedGradeIndex = 0;
  int selectedTabIndex = 0;

  /// دالة مشتركة لاستدعاء الامتحانات
  void _fetchExams(int subjectId) {
    if (selectedTabIndex == 0) {
      context.read<ExamPreCubit>().getExamPre(id: subjectId);
    } else {
      context.read<ExamCurrentCubit>().getExamCurrent(id: subjectId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 238, 246),
      appBar: AppBar(
        title: Text("الإختبارات", style: Styles.largeWhite),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: MultiBlocListener(
        listeners: [
          /// أول ما تتحمل المواد، نستدعي الامتحانات للمادة الأولى
          BlocListener<SubjectCubit, SubjectState>(
            listenWhen: (prev, curr) => curr is SubjectLoadedSuccess,
            listener: (context, state) {
              if (state is SubjectLoadedSuccess && state.subjects.isNotEmpty) {
                final firstSubjectId = state.subjects[0].id!;
                _fetchExams(firstSubjectId);
              }
            },
          ),
        ],
        child: Column(
          children: [
            /// شريط التبويبات (الامتحانات السابقة / الحالية)
            ExamTypeTabBar(
              selectedTabIndex: selectedTabIndex,
              onTabSelected: (index) {
                setState(() => selectedTabIndex = index);

                final subjectsState = context.read<SubjectCubit>().state;
                if (subjectsState is SubjectLoadedSuccess &&
                    subjectsState.subjects.isNotEmpty) {
                  final subjectId =
                      subjectsState.subjects[selectedGradeIndex].id!;
                  _fetchExams(subjectId);
                }
              },
            ),

            /// شريط اختيار المواد
            BlocBuilder<SubjectCubit, SubjectState>(
              builder: (context, state) {
                if (state is SubjectLoadedSuccess) {
                  return SubjectSelectorBar(
                    subjects: state.subjects,
                    selectedIndex: selectedGradeIndex,
                    onSubjectSelected: (index) {
                      setState(() => selectedGradeIndex = index);
                      _fetchExams(state.subjects[index].id!);
                    },
                  );
                }
                return SubjectSelectorBarShimmer();
              },
            ),

            /// قائمة الامتحانات
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child:
                    selectedTabIndex == 0
                        ? PreviousExamListWidget()
                        : CurrentExamListWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
