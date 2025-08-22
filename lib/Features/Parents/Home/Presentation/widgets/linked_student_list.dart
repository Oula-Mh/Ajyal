import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LinkedStudentList extends StatelessWidget {
  const LinkedStudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.purple.withAlpha(30),
          child: IconButton(
            icon: const Icon(Icons.group_add, size: 28, color: AppColor.purple),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.allStudentLinked);
            },
          ),
        ),
        const SizedBox(height: 8),
        const Text("عرض الطلاب", style: TextStyle(fontSize: 13)),
      ],
    );
  }
}
