import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LinkStudent extends StatelessWidget {
  const LinkStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.green.shade50,
          child: IconButton(
            icon: const Icon(Icons.qr_code, size: 28, color: Colors.green),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.linkStudentScanner);
            },
          ),
        ),
        const SizedBox(height: 8),
        const Text("الربط مع طالب", style: TextStyle(fontSize: 13)),
      ],
    );
  }
}
