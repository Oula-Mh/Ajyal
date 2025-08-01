import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class AnalysisTabbar extends StatelessWidget {
  final TabController controller;
  const AnalysisTabbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.2),
      ),
      child: Stack(
        children: [
          // الفواصل
          Positioned.fill(
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                Container(
                  width: 1,
                  color: AppColor.primaryColor,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  width: 1,
                  color: AppColor.primaryColor,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          // التابات
          TabBar(
            controller: controller,
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: AppColor.primaryColor,
            indicatorColor: AppColor.primaryColor,
            // indicator: BoxDecoration(
            //   color: const Color.fromARGB(255, 51, 67, 95),
            //   borderRadius: BorderRadius.circular(10),
            //   // border: Border.all(color: Colors.blue),
            // ),
            tabs: const [
              Tab(text: "كتابية"),
              Tab(text: "إلكترونية"),
              Tab(text: "كليهما"),
            ],
          ),
        ],
      ),
    );
  }
}
