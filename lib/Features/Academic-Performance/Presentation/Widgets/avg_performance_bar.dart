import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:flutter/material.dart';

class AvgPerformanceBar extends StatelessWidget {
  final double value; // يجب أن تكون بين 0 و 100
  final String title;
  final bool isStddev;

  const AvgPerformanceBar({
    super.key,
    required this.value,
    required this.title,
    required this.isStddev,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$title \t\t",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
            isStddev
                ? GestureDetector(
                  onTap: () {
                    showVarianceDialog(context, value);
                  },
                  child: Icon(Icons.lightbulb_outlined, color: Colors.amber),
                )
                : SizedBox(),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 15,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: value / 100),
            duration: const Duration(seconds: 1),
            builder: (context, animatedValue, _) {
              return Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: animatedValue,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColor.primaryColor.withOpacity(0.7),
                            Colors.blueAccent.withOpacity(0.4),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "%  ${value.toStringAsFixed(0)}",
                      style: TextStyle(
                        color: value > 50 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
