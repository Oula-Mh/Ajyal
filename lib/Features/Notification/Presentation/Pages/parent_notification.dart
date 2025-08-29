import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ParentNotification extends StatelessWidget {
  const ParentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية
    final List<NotificationItem> notifications = [
      NotificationItem(
        title: "إشعار جديد",
        body: "تمت إضافة درس جديد إلى الكورس الخاص بك.",
        date: "2025-08-28",
      ),
      NotificationItem(
        title: "تنبيه",
        body:
            "موعد الامتحان غداً الساعة 10 صباحاً.موعد الامتحان غداً الساعة 10 صباح موعد الامتحان غداً الساعة 10 صباح",
        date: "2025-08-27",
      ),
      NotificationItem(
        title: "تذكير",
        body: "يرجى إكمال الواجب قبل نهاية الأسبوع.",
        date: "2025-08-25",
      ),
    ];
    return Scaffold(
      appBar: customAppBar(context, "الإشعارات"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];

            // التبديل بين لونين
            final Color containerColor =
                index.isEven
                    ? AppColor.secondaryColor.withAlpha(110)
                    : const Color.fromARGB(255, 225, 243, 205);

            return Container(
              margin: const EdgeInsets.only(bottom: 13),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          notification.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        notification.date,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Text(
                    notification.body,
                    style: const TextStyle(fontSize: 14, height: 1.8),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String body;
  final String date;

  NotificationItem({
    required this.title,
    required this.body,
    required this.date,
  });
}
