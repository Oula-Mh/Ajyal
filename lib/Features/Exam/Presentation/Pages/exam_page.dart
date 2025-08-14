//sarah

// import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
// import 'package:ajyal/Core/routes/app_router.dart';
// import 'package:ajyal/Core/routes/route_constant.dart';
// import 'package:ajyal/Core/styles/app_color.dart';
// import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
// import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/exam_type_tab_bar.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/previous_exam_card.dart';
// import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/subject_skelton.dart';
// import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
// import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
// import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../widgets/Exam_page/course_selector_widget.dart';
// import '../widgets/Exam_page/subject_selector_bar.dart';

// class ExamPage extends StatefulWidget {
//   const ExamPage({super.key});

//   @override
//   State<ExamPage> createState() => _ExamPageState();
// }

// class _ExamPageState extends State<ExamPage> {
//   int selectedGradeIndex = 0;
//   int selectedTabIndex = 0;
//   int selectedSubjectIndex = 0;
//   List<Map<String, dynamic>> results = [];
//   bool isLoadingResults = false;

//   Future<List<ExamModel>> fetchFakeExamsBySubject(int subjectId) async {
//     await Future.delayed(const Duration(seconds: 1)); // simulate loading

//     final mockData = {
//       1: [
//         {
//           "id": 1,
//           "name": "اختبار الوحدة 1",
//           "type": "Timed",
//           "available": 1,
//           "start_time": "2025-07-30",
//           "duration": "30.00",
//         },
//         {
//           "id": 2,
//           "name": "اختبار منتصف الفصل",
//           "type": "Practice",
//           "available": 1,
//           "start_time": "2025-08-05",
//           "duration": "45.00",
//         },
//       ],
//       2: [
//         {
//           "id": 3,
//           "name": "اختبار فيزياء 1",
//           "type": "Timed",
//           "available": 1,
//           "start_time": "2025-08-01",
//           "duration": "40.00",
//         },
//       ],
//       3: [], // مادة لا تحتوي اختبارات
//     };

//     final data = mockData[subjectId] ?? [];

//     return data.map((e) => ExamModel.fromJson(e)).toList();
//   }

//   void loadExams(int subjectId) async {
//     setState(() {
//       isLoadingResults = true;
//     });

//     final exams = await fetchFakeExamsBySubject(subjectId);

//     setState(() {
//       results = exams.map((e) => e.toResult()).toList();
//       isLoadingResults = false;
//     });
//   }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   subjects =
//   //       subjectsFromBackend.map((item) {
//   //         final name = item["subject"];
//   //         return {
//   //           "name": name,
//   //           "results": item["results"],
//   //           "icon": subjectIcons[name] ?? Icons.help_outline,
//   //         };
//   //       }).toList();
//   // }

//   Color getColor(int score) {
//     if (score >= 90) return Colors.green;
//     if (score >= 60) return Colors.orange;
//     return Colors.red;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final results = List<Map<String, dynamic>>.from(
//     //   selectedSubject["results"] ?? [],
//     // );
//     final cubit = CourseCubit.get(context);
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 229, 238, 246),
//       appBar: AppBar(
//         title: const Text("الاختبارات", style: TextStyle(color: Colors.white)),
//         backgroundColor: AppColor.primaryColor,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.school, color: Colors.white),
//             tooltip: "تحديد الكورس",
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder:
//                     (_) => MultiBlocProvider(
//                       providers: [
//                         BlocProvider(
//                           create:
//                               (context) => CourseCubit(
//                                 CourseRepoimp(DioConsumer(Dio())),
//                               ),
//                         ),
//                         BlocProvider(
//                           create:
//                               (context) => SubjectCubit(
//                                 SubjectRepoimp(DioConsumer(Dio())),
//                               ),
//                         ),
//                       ],
//                       child: CourseSelectorWidget(
//                         onCourseSelected: (String selectedCourseId) {
//                           context.read<SubjectCubit>().fetchSubjects(
//                             int.parse(selectedCourseId),
//                           );
//                         },
//                       ),
//                     ),
//               );
//             },

//             // onPressed: () {
//             //   showModalBottomSheet(
//             //     context: context,
//             //     builder:
//             //         (_) => CourseSelectorWidget(
//             //           cubit: cubit,
//             //           onCourseSelected: (String _) {},
//             //         ),
//             //   );
//             // },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           ExamTypeTabBar(
//             selectedTabIndex: selectedTabIndex,
//             onTabSelected: (index) => setState(() => selectedTabIndex = index),
//           ),
// BlocBuilder<SubjectCubit, SubjectState>(
//   builder: (context, subjectState) {
//     if (subjectState is SubjectLoading) {
//       return SkeletonSubjectSelectorBar();
//     } else if (subjectState is SubjectLoadedSuccess) {
//       //  selectedSubjectId = state.subjects[0].id!;
//       // جلب الاختبارات أول مرة
//       // final selectedSubject = subjects[selectedSubjectIndex];
//       // context.read<ExamCubit>().getExamsForSubject(selectedSubject.id!);
//       if (results.isEmpty) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           loadExams(subjectState.subjects[selectedSubjectIndex].id!);
//         });
//       }
//       return SubjectSelectorBar(
//         subjects: subjectState.subjects,
//         selectedIndex: selectedGradeIndex,
//         onSubjectSelected: (index) {
//           setState(() {
//             selectedSubjectIndex = index;
//             selectedGradeIndex = index;
//             isLoadingResults = true;
//             results = [];
//           });
//           loadExams(subjectState.subjects[index].id!);
//         },
//       );
//     } else if (subjectState is SubjectError) {
//       return Center(
//         child: Text("فشل تحميل المواد\n تحقق من الاتصال بالإنترنت"),
//       );
//     } else {
//       return Center(child: Text("انتظر تحميل المواد..."));
//     }
//   },
// ),

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
//                   isLoadingResults
//                       ? const Center(child: CircularProgressIndicator())
//                       : selectedTabIndex == 0
//                       ? buildResults(results)
//                       : buildCurrentExamButton(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildResults(List<Map<String, dynamic>> results) {
//     if (results.isEmpty) {
//       return const Center(
//         child: Text(
//           "لا توجد نتائج لهذه المادة.",
//           style: TextStyle(color: Colors.grey),
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             const Text(
//               "النتائج الأخيرة",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const Spacer(),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: AppColor.secondaryColor,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Text(
//                 "${_calculateAverage(results)}%",
//                 style: const TextStyle(
//                   color: AppColor.primaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),
//         Expanded(
//           child: ListView.builder(
//             itemCount: results.length,
//             itemBuilder: (context, index) {
//               return PreviousExamCard(
//                 result: results[index],
//                 getColor: getColor,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildCurrentExamButton() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GestureDetector(
//           onTap: () {
//             GoRouter.of(context).push(
//               AppRouter.examCurrentPage,
//               extra: {'initialTime': 120, 'totalTime': 180},
//             );
//           },
//           child: const Text("Go"),
//         ),
//       ],
//     );
//   }

//   int _calculateAverage(List<Map<String, dynamic>> results) {
//     if (results.isEmpty) return 0;
//     int total = results.fold(0, (sum, item) => sum + (item['score'] as int));
//     return (total / results.length).round();
//   }
// }

// class ExamModel {
//   final int id;
//   final String name;
//   final String type;
//   final bool available;
//   final String startTime;
//   final String duration;

//   ExamModel({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.available,
//     required this.startTime,
//     required this.duration,
//   });

//   factory ExamModel.fromJson(Map<String, dynamic> json) {
//     return ExamModel(
//       id: json['id'],
//       name: json['name'],
//       type: json['type'],
//       available: json['available'] == 1,
//       startTime: json['start_time'],
//       duration: json['duration'],
//     );
//   }

//   Map<String, dynamic> toResult() {
//     return {
//       'id': id,
//       'name': name,
//       'score': 80 + (id * 2) % 20, // Score وهمي متغير
//       'date': startTime,
//     };
//   }
// }

//oula

import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current/exam_current_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre/exam_pre_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/current_exam_list_widget.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/exam_type_tab_bar.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/previous_exam_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/Exam_page/course_selector_widget.dart';
import '../widgets/Exam_page/subject_selector_bar.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class SubjectWithIcon {
  final int id;
  final String name;
  final IconData icon;

  SubjectWithIcon({required this.id, required this.name, required this.icon});
}

class _ExamPageState extends State<ExamPage> {
  int selectedGradeIndex = 0;
  int selectedTabIndex = 0;

  final List<SubjectWithIcon> subjects = [
    SubjectWithIcon(id: 1, name: "رياضيات", icon: Icons.calculate),
    SubjectWithIcon(id: 2, name: "فيزياء", icon: Icons.science),
    SubjectWithIcon(id: 3, name: "كيمياء", icon: Icons.bubble_chart),
    SubjectWithIcon(id: 4, name: "علوم", icon: Icons.biotech),
    SubjectWithIcon(id: 5, name: "عربي", icon: Icons.menu_book),
  ];

  @override
  void initState() {
    super.initState();
    context.read<ExamPreCubit>().getExamPre(id: selectedGradeIndex + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 238, 246),
      appBar: AppBar(
        title: const Text("الاختبارات", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.school, color: Colors.white),
            tooltip: "تحديد الكورس",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder:
                    (_) =>
                        CourseSelectorWidget(onCourseSelected: (String _) {}),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ExamTypeTabBar(
            selectedTabIndex: selectedTabIndex,
            onTabSelected: (index) {
              setState(() => selectedTabIndex = index);

              if (index == 0) {
                // اختبارات سابقة
                context.read<ExamPreCubit>().getExamPre(
                  id: selectedGradeIndex + 1,
                );
              } else if (index == 1) {
                // اختبارات حالية
                context.read<ExamCurrentCubit>().getExamCurrent(
                  id: selectedGradeIndex + 1,
                );
              }
            },
          ),

          SubjectSelectorBar(
            subjects: subjects,
            selectedIndex: selectedGradeIndex,
            onSubjectSelected: (index) {
              setState(() => selectedGradeIndex = index);

              if (selectedTabIndex == 0) {
                context.read<ExamPreCubit>().getExamPre(id: subjects[index].id);
              } else {
                context.read<ExamCurrentCubit>().getExamCurrent(
                  id: subjects[index].id,
                );
              }
            },
          ),
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
    );
  }
}
