import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class ExamCharSkelton extends StatelessWidget {
  final bool showChart;
  const ExamCharSkelton({super.key, required this.showChart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              " مخطط لتوضيح درجاتك في الاختبارات : ",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                showChart ? "إخفاء " : "إظهار",
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ],
        ),
        showChart
            ? SizedBox(
              height: 250,
              child: Center(
                child: CircularProgressIndicator(color: Colors.grey),
              ),
            )
            : SizedBox(height: 70),
      ],
    );
  }
}
