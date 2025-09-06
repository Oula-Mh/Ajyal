import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:flutter/material.dart';
import 'package:ajyal/Core/styles/app_color.dart';

class NotificationIcon extends StatelessWidget {
  final bool isStudent;
  const NotificationIcon({super.key, required this.isStudent});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: notiCountNotifier,
      builder: (context, count, _) {
        return count == 0
            ? Icon(
              Icons.notifications,
              size: isStudent ? 32 : 30,
              color: isStudent ? Colors.white : AppColor.primaryColor,
            )
            : Badge(
              label: Text(
                count.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              child: Icon(
                Icons.notifications,
                size: isStudent ? 30 : 30,
                color: isStudent ? Colors.white : AppColor.primaryColor,
              ),
            );
      },
    );
  }
}
