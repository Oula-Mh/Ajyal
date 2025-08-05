import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class PercentBarSkelton extends StatelessWidget {
  final String title;

  const PercentBarSkelton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$title \t\t",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 15,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }
}
