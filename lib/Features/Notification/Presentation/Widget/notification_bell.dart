import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  final bool isStudent;
  const NotificationIcon({super.key, required this.isStudent});

  @override
  Widget build(BuildContext context) {
    int count = getit<CacheHelper>().getData(key: "notiCount") ?? 0;
    return count == 0
        ? Icon(
          Icons.notifications,
          size: isStudent ? 32 : 30,
          color: isStudent ? Colors.white : AppColor.primaryColor,
        )
        : Badge(
          label: Text(count.toString(), style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
          child: Icon(
            Icons.notifications,
            size: isStudent ? 30 : 30,
            color: isStudent ? Colors.white : AppColor.primaryColor,
          ),
        );
  }
}
