import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Academic-Performance/Data/mock.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/analysis_tabbar.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/avg_performance_bar.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/chart.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/course_analysis.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/item_analys_selection.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/name_scroe_exam.dart';
import 'package:flutter/material.dart';

class AnalysPerfPage extends StatefulWidget {
  const AnalysPerfPage({super.key});

  @override
  State<AnalysPerfPage> createState() => _AnalysPerfPageState();
}

class _AnalysPerfPageState extends State<AnalysPerfPage>
    with SingleTickerProviderStateMixin {
  bool showChart = false;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();

    _tabController.addListener(() {
      setState(() {}); // لتحديث الرسم البياني عند تغيير التبويب
    });
  }

  List<Map<String, dynamic>> getChartDataForTab(int index) {
    return mockSubjects;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "     تقدمي في البكالوريا العلمي ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            height: MediaQuery.of(context).size.height * 0.87,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  CourseAnalysis(percent: 0.60),
                  ItemAnalysSelection(selectItemName: "مادة الرياضيات"),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      color: AppColor.white1,

                      child: Column(
                        children: [
                          AnalysisTabbar(controller: _tabController),
                          const SizedBox(height: 20),
                          Builder(
                            builder: (_) {
                              final currentTabIndex = _tabController.index;
                              final tabKey =
                                  currentTabIndex == 0
                                      ? 'written'
                                      : currentTabIndex == 1
                                      ? 'online'
                                      : 'both';
                              final subject =
                                  mockSubjects[0]; // يمكنك تغيير المؤشر لاحقاً
                              final stats = subject['examTypesStats'][tabKey];

                              final exams = stats['exams'];

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AvgPerformanceBar(
                                      title: "متوسط الأداء:",
                                      value: stats['average'] ?? 0,
                                    ),
                                    const SizedBox(height: 11),
                                    AvgPerformanceBar(
                                      title: " مدى تباين درجاتك:",
                                      value: stats['stdDev'] ?? 0,
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "الاختبارات : ",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.primaryColor,
                                            fontSize: 14.5,
                                          ),
                                        ),
                                        Text(
                                          "${exams.length} اختبار",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium?.copyWith(
                                            color: AppColor.primaryColor,
                                            fontSize: 14.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    NameAndScoreList(exams: exams),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Text(
                                          "الرسم البياني : ",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.primaryColor,
                                            fontSize: 14.5,
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            setState(
                                              () => showChart = !showChart,
                                            );
                                          },
                                          child: Text(
                                            showChart ? "إخفاء " : "إظهار",
                                          ),
                                        ),
                                      ],
                                    ),
                                    showChart
                                        ? SizedBox(
                                          height: 250,
                                          child: ExamLineChartPage(data: exams),
                                        )
                                        : SizedBox(height: 70),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
