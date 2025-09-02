import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UnPaidInvoicesCardShimmer extends StatelessWidget {
  const UnPaidInvoicesCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.white1,
      elevation: 1,
      margin: const EdgeInsets.only(top: 21, right: 12, left: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SkeletonLine(width: 110, height: 14),
                    const SizedBox(height: 5),
                    _SkeletonLine(width: 90, height: 20),
                    const SizedBox(height: 5),

                    _SkeletonLine(width: 160, height: 14),
                  ],
                ),
              ),

              Container(
                height: 40,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  final double width;
  final double height;

  const _SkeletonLine({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
