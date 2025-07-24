import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/exam_type_tab_bar.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_page/previous_exam_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/Exam_page/course_selector_widget.dart';
import '../widgets/Exam_page/subject_selector_bar.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int selectedGradeIndex = 0;
  int selectedTabIndex = 0;

  List<Map<String, dynamic>> subjectsFromBackend = [
    {
      "subject": "رياضيات",
      "results": [
        {"date": "28/03/2024 - 12:33", "score": 90},
        {"date": "26/03/2024 - 16:58", "score": 70},
        {"date": "28/03/2024 - 12:33", "score": 40},
        {"date": "26/03/2024 - 16:58", "score": 65},
        {"date": "28/03/2024 - 12:33", "score": 100},
        {"date": "26/03/2024 - 16:58", "score": 20},
      ],
    },
    {
      "subject": "فيزياء",
      "results": [
        {"date": "24/03/2024 10:10", "score": 40},
        {"date": "24/03/2024 09:40", "score": 90},
      ],
    },
    {
      "subject": "كيمياء",
      "results": [
        {"date": "20/03/2024 11:15", "score": 60},
      ],
    },
    {
      "subject": "علوم",
      "results": [
        {"date": "20/03/2024 11:15", "score": 60},
        {"date": "20/03/2024 11:15", "score": 100},
        {"date": "20/03/2024 11:15", "score": 40},
      ],
    },
    {
      "subject": "عربي",
      "results": [
        {"date": "20/03/2024 11:15", "score": 60},
      ],
    },
    {"subject": "إنكليزي", "results": []},
  ];

  final Map<String, IconData> subjectIcons = {
    "رياضيات": Icons.calculate,
    "فيزياء": Icons.science,
    "كيمياء": Icons.bubble_chart,
    "علوم": Icons.biotech,
    "عربي": Icons.menu_book,
    "إنكليزي": Icons.language,
    "فلسفة": Icons.psychology,
    "ديانة": Icons.mosque,
  };

  late List<Map<String, dynamic>> subjects;

  @override
  void initState() {
    super.initState();
    subjects =
        subjectsFromBackend.map((item) {
          final name = item["subject"];
          return {
            "name": name,
            "results": item["results"],
            "icon": subjectIcons[name] ?? Icons.help_outline,
          };
        }).toList();
  }

  Color getColor(int score) {
    if (score >= 90) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final selectedSubject = subjects[selectedGradeIndex];
    final results = List<Map<String, dynamic>>.from(
      selectedSubject["results"] ?? [],
    );

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
            onTabSelected: (index) => setState(() => selectedTabIndex = index),
          ),
          SubjectSelectorBar(
            subjects: subjects,
            selectedIndex: selectedGradeIndex,
            onSubjectSelected:
                (index) => setState(() => selectedGradeIndex = index),
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
                      ? buildResults(results)
                      : buildCurrentExamButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildResults(List<Map<String, dynamic>> results) {
    if (results.isEmpty) {
      return const Center(
        child: Text(
          "لا توجد نتائج لهذه المادة.",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "النتائج الأخيرة",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "${_calculateAverage(results)}%",
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return PreviousExamCard(
                result: results[index],
                getColor: getColor,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCurrentExamButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.examCurrentPage,
              extra: {'initialTime': 120, 'totalTime': 180},
            );
          },
          child: const Text("Go"),
        ),
      ],
    );
  }

  int _calculateAverage(List<Map<String, dynamic>> results) {
    if (results.isEmpty) return 0;
    int total = results.fold(0, (sum, item) => sum + (item['score'] as int));
    return (total / results.length).round();
  }
}
