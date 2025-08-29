import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:flutter/material.dart';

class StudentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<SubjectMeanParentModel> subjects;
  const StudentAppBar({
    super.key,
    required this.tabController,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      elevation: 0,
      backgroundColor: AppColor.primaryColor,
      title: const Text(
        "تفاصيل العلامات",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: TabBar(
          controller: tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 4, color: AppColor.secondaryColor),
          ),
          labelColor: AppColor.secondaryColor,
          unselectedLabelColor: AppColor.white1.withOpacity(0.7),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Cairo",
          ),
          tabs: subjects.map((s) => Tab(text: s.name)).toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 60);
}
