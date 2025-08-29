import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';

class ViewDetailsCard extends StatelessWidget {
  final List<SubjectMeanParentModel> subjects;

  const ViewDetailsCard({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: ListTile(
        title: const Center(
          child: Text(
            "عرض تفاصيل العلامات لكل مادة",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          GoRouter.of(
            context,
          ).push(AppRouter.studentSubjectDetails, extra: subjects);
        },
      ),
    );
  }
}
