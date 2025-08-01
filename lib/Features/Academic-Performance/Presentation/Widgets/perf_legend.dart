import 'package:flutter/material.dart';

class PerformanceLegend extends StatelessWidget {
  const PerformanceLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final levels = [
      {"color": Colors.redAccent, "label": "ضعيف", "range": "30%"},
      {"color": Colors.orangeAccent, "label": "جيد", "range": "60%"},
      {"color": Colors.lightBlue, "label": "جيد جدًا", "range": "90%"},
      {"color": Colors.green, "label": "ممتاز", "range": "100%"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          levels.map((level) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: level['color'] as Color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text("${level['range']}", style: const TextStyle(fontSize: 11)),
              ],
            );
          }).toList(),
    );
  }
}
