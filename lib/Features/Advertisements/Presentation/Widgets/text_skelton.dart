import 'package:flutter/material.dart';

class TextSkeleton extends StatelessWidget {
  final double width;
  final double height;

  const TextSkeleton({super.key, this.width = 100, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF2F4170).withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
