import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SubjectSelectorBarShimmer extends StatelessWidget {
  const SubjectSelectorBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // عدد العناصر الوهمية
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // shimmer للدائرة
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 30,
                  ),
                ),
                const SizedBox(height: 4),
                // shimmer لاسم المادة
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 40,
                    height: 10,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
