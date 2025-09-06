import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectCourseIcon extends StatelessWidget {
  const SelectCourseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.shade50,
          child: IconButton(
            icon: const Icon(
              Icons.book_outlined,
              size: 28,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.slectedCoursePage,
                extra: {
                  "id":
                      getit<CacheHelper>().getData(key: "studentId").toString(),
                  "isParent": true,
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        const Text("اختيار كورس ", style: TextStyle(fontSize: 13)),
      ],
    );
  }
}
