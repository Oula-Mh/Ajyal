import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/analys_perf_body.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Widgets/custom_analys_appbar.dart';
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
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomAnalysAppbar(onPressed: () {}),
          SizedBox(height: 6),
          AnalysPerfBody(
            controller: _tabController,
            showChart: showChart,
            onTap: () {
              setState(() => showChart = !showChart);
            },
          ),
        ],
      ),
    );
  }
}
