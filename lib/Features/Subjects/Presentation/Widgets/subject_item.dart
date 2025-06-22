import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectItem {
  final String title;
  final IconData icon;
  final String subtitle;

  SubjectItem(this.title, this.icon, this.subtitle);
}

class SubjectCard extends StatelessWidget {
  final String subject;
  final IconData icon;

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
              height: 65,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor.withAlpha(90),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 35, color: AppColor.primaryColor),
            ),
            Text(
              subject,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "10 ملفات",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.pdfPage);
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
