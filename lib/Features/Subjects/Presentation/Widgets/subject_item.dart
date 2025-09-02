import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectItem {
  final String title;
  final Widget icon;
  final String subtitle;

  SubjectItem(this.title, this.icon, this.subtitle);
}

class SubjectCard extends StatelessWidget {
  final SubjectModel subject;
  final Widget icon;

  const SubjectCard({super.key, required this.subject, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(10),
              height: 65,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withAlpha(90),
                borderRadius: BorderRadius.circular(12),
              ),
              child: icon,
            ),
            Text(
              subject.name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              subject.description ?? "...",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.pdfPage, extra: subject.id);
              },

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: AppColor.primaryColor, width: 1),
                ),
                minimumSize: Size(double.infinity, 34),
              ),
              child: Text(
                "عرض",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
