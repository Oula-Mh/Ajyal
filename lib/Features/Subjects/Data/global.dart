import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:flutter/material.dart';

final List<String> courses = [
  'البكالوريا العلمي',
  'البكالوريا الأدبي',
  'مكثفة علم الأحياء',
  'المكثفة الشاملة',
];

/// عداد الإشعارات
// ValueNotifier<int> notificationCounter = ValueNotifier<int>(0);

// extension NotificationCounterExt on ValueNotifier<int> {
//   void increase() => value++;
//   void reset() => value = 0;
// }

Future<int> getNotificationCount() async {
  return CacheHelper().getData(key: "notiCount") ?? 0;
}

//final selectdCourse = getit<CacheHelper>().getData(key: "SelectedCourse");
