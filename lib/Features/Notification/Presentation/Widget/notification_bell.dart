import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    int count = getit<CacheHelper>().getData(key: "notiCount") ?? 0;
    return count == 0
        ? Icon(Icons.notifications, size: 30, color: AppColor.primaryColor)
        : Badge(
          label: Text(count.toString(), style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
          child: Icon(
            Icons.notifications,
            size: 30,
            color: AppColor.primaryColor,
          ),
        );
  }
}
