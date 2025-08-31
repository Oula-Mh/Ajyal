import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Notification/Presentation/Widget/notification_bell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ParentPageChoice extends StatelessWidget {
  const ParentPageChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              getit<CacheHelper>().removeData(key: "notiCount");
              GoRouter.of(context).push(AppRouter.parentNotification);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade300),
              ),
              child: Center(
                child: ListTile(
                  title: Text(
                    "    الإشعارات",
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryColor,
                      height: 2.5,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.shade300),
                      shape: BoxShape.circle,
                    ),
                    child: NotificationIcon(isStudent: false),
                    // child: Icon(
                    //   Icons.notifications,
                    //   color: AppColor.primaryColor,
                    // ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 17),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 15,
            childAspectRatio: 1.8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              gridTile("نتائج الطالب", () {
                GoRouter.of(context).push(AppRouter.studentMarkAnalysis);
              }),
              gridTile("تقييم الحضور", () {
                GoRouter.of(context).push(AppRouter.attendecePage);
              }),
              gridTile("الأقساط المالية", () {}),
              gridTile("التواصل مع الإدارة", () {
                GoRouter.of(context).push(AppRouter.contactUsPage);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget gridTile(String title, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blue.shade300),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
