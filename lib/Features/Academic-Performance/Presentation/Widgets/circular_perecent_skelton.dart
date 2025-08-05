import 'package:flutter/material.dart';

class CircularPercentSkeleton extends StatelessWidget {
  const CircularPercentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66, // 2 * radius = 2 * 33
      height: 66,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300], // لون وهمي
      ),
      child: Center(
        child: Container(
          width: 30,
          height: 12,
          color: Colors.grey[200], // مكان النسبة
        ),
      ),
    );
  }
}
