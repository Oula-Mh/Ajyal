import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExamShimmerWidget extends StatelessWidget {
  const ExamShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      itemCount: 3, // عدد البطاقات التي تظهر أثناء التحميل
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              period: const Duration(milliseconds: 800),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  Container(height: 25, width: 150, color: Colors.white),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(height: 25, width: 100, color: Colors.white),
                      const SizedBox(width: 8),
                      Container(height: 25, width: 100, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 25,
                    width: double.infinity,
                    color: Colors.white,
                    //   margin: const EdgeInsets.only(right: 50),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
