import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CourseAdvShimmer extends StatelessWidget {
  const CourseAdvShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Color shimmerColor = Color.fromARGB(255, 227, 239, 243);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.54,
        decoration: BoxDecoration(
          color: AppColor.fillTextField,
          border: Border.all(color: AppColor.borderTextField),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer for image
            Shimmer.fromColors(
              baseColor: shimmerColor, // The base color of the shimmer
              highlightColor:
                  Colors.grey[100]!, // The highlight color of the shimmer
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color:
                      AppColor
                          .secondaryColor, // This color will be overridden by shimmer
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Shimmer for title
            Shimmer.fromColors(
              baseColor: shimmerColor,
              highlightColor:
                  Colors.grey[100]!, // The highlight color of the shimmer
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Shimmer for second line of title
            Shimmer.fromColors(
              baseColor: shimmerColor,
              highlightColor:
                  Colors.grey[100]!, // The highlight color of the shimmer
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Shimmer for date and button
            Shimmer.fromColors(
              baseColor: shimmerColor,
              highlightColor:
                  Colors.grey[100]!, // The highlight color of the shimmer
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 100, height: 20, color: Colors.white),
                    Container(width: 60, height: 20, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
