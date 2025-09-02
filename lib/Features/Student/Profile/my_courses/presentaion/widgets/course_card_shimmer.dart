import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  Widget _shimmerBox({
    double height = 16,
    double width = double.infinity,
    double radius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Align(
            alignment: Alignment.topRight,
            child: _shimmerBox(height: 24, width: 80, radius: 12),
          ),
          const SizedBox(height: 14),
          // Course name
          _shimmerBox(height: 20, width: 160),
          const SizedBox(height: 8),
          // Course code
          _shimmerBox(height: 16, width: 100),
          const SizedBox(height: 12),
          // "عرض البرنامج" button
          Align(
            alignment: Alignment.centerRight,
            child: _shimmerBox(height: 28, width: 120, radius: 14),
          ),
          const SizedBox(height: 12),
          // Buttons row
          Row(
            children: [
              _shimmerBox(height: 36, width: 100, radius: 20),
              const SizedBox(width: 20),
              _shimmerBox(height: 36, width: 110, radius: 20),
            ],
          ),
        ],
      ),
    );
  }
}
