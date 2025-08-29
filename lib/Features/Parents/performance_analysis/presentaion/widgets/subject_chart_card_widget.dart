import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/subject_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import '../../data/models/subject_mean_parent_model.dart';

class SubjectChartCardWidget extends StatelessWidget {
  final List<SubjectMeanParentModel> subjects;

  const SubjectChartCardWidget({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "معدل كل مادة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: SubjectBarChartWidget(subjects: subjects),
            ),
          ],
        ),
      ),
    );
  }
}
