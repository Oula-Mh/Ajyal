import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ajyal/Core/styles/app_color.dart';

// class MainCardWidget extends StatelessWidget {
//   final double average;
//   final String performance;
//   final Color color;

//   const MainCardWidget({
//     super.key,
//     required this.average,
//     required this.performance,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         color: AppColor.primaryColor,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 8,
//             offset: const Offset(2, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start, // محاذاة المحتوى للأعلى
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     "المعدل العام",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   CircularPercentIndicator(
//                     animation: true,
//                     radius: 50,
//                     lineWidth: 13,
//                     percent: average / 100,
//                     progressColor: color,
//                     backgroundColor: Colors.white24,
//                     circularStrokeCap: CircularStrokeCap.round,
//                     center: Text(
//                       "${average.toStringAsFixed(1)}%",
//                       style: TextStyle(
//                         fontSize: 19,
//                         fontWeight: FontWeight.bold,
//                         color: color,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 100,
//               width: 1.5,
//               color: Colors.white.withOpacity(0.6),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     "أداء الطالب",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 12), // تقليل المسافة لتكون متناسقة
//                   Text(
//                     performance,
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: color,
//                       shadows: const [
//                         Shadow(
//                           color: Colors.black26,
//                           offset: Offset(1, 1),
//                           blurRadius: 3,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class MainCardWidget extends StatelessWidget {
  final double average;
  final String performance;
  final Color color;
  final double screenWidth;
  final double screenHeight;

  const MainCardWidget({
    super.key,
    required this.average,
    required this.performance,
    required this.color,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    final cardPaddingVertical = screenHeight * 0.02;
    final cardPaddingHorizontal = screenWidth * 0.03;
    final radius = screenWidth * 0.06;
    final textSizeTitle = screenWidth * 0.045;
    final textSizePerformance = screenWidth * 0.06;
    final circularRadius = screenWidth * 0.12;
    final lineWidth = screenWidth * 0.025;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColor.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: cardPaddingVertical,
          horizontal: cardPaddingHorizontal,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "المعدل العام",
                    style: TextStyle(
                      fontSize: textSizeTitle,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CircularPercentIndicator(
                    animation: true,
                    radius: circularRadius,
                    lineWidth: lineWidth,
                    percent: average / 100,
                    progressColor: color,
                    backgroundColor: Colors.white24,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "${average.toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: textSizeTitle,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.12,
              width: 1.5,
              color: Colors.white.withOpacity(0.6),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "أداء الطالب",
                    style: TextStyle(
                      fontSize: textSizeTitle,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    performance,
                    style: TextStyle(
                      fontSize: textSizePerformance,
                      fontWeight: FontWeight.bold,
                      color: color,
                      shadows: const [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
