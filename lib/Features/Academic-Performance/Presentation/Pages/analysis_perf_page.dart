import 'package:ajyal/Features/Academic-Performance/Data/mock.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("التقدم الأكاديمي")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// متوسط الأداء العام
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("متوسط درجاتك العام", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.84,
                      center: Text(
                        "84 %",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: Colors.blueAccent,
                      footer: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("متوسط الأداء العام"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// تبويبات الامتحانات
            TabBar(
              controller: _tabController,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blueAccent,
              tabs: const [
                Tab(text: "كتابية"),
                Tab(text: "إلكترونية"),
                Tab(text: "كليهما"),
              ],
            ),

            /// زر عرض الرسم البياني
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() => showChart = !showChart);
                },
                child: Text(
                  showChart ? "إخفاء الرسم البياني" : "عرض الرسم البياني",
                ),
              ),
            ),

            /// الرسم البياني (Placeholder)
            if (showChart)
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: Text("🔷 هنا سيكون الرسم البياني"),
              ),

            /// قائمة المواد
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(3, (tabIndex) {
                  return ListView.builder(
                    itemCount: mockSubjects.length,
                    itemBuilder: (context, index) {
                      final subject = mockSubjects[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// اسم المادة + progress line
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    subject['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${(subject['average'] * 100).round()}%",
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              LinearProgressIndicator(
                                value: subject['average'],
                                minHeight: 8,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.blueAccent,
                                ),
                              ),
                              const SizedBox(height: 12),

                              /// تفاصيل الامتحانات
                              ...List.generate(subject['exams'].length, (i) {
                                final exam = subject['exams'][i];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(exam['name']),
                                    Text("${exam['score']} / 100"),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
