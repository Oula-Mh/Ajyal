import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InvoicesShimmer extends StatelessWidget {
  final double textScale;
  const InvoicesShimmer({super.key, required this.textScale});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250 * textScale,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20 * textScale),
                  bottomRight: Radius.circular(20 * textScale),
                ),
              ),
              margin: const EdgeInsets.only(bottom: 20),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                children: List.generate(
                  3,
                  (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: index <= 2 ? 12 : 0),
                      height: 36 * textScale,
                      width: 10 * textScale,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20 * textScale),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8 * textScale),
                    height: 120 * textScale,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12 * textScale),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
