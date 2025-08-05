import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class NameAndScoreListSkeleton extends StatelessWidget {
  const NameAndScoreListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    // عدد العناصر الظاهرة مؤقتًا أثناء التحميل
    const int itemCount = 2;

    return Column(
      children: [
        // العنوان والعدد
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الاختبارات : ",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
            Text(
              "0 اختبار",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // العناصر الوهمية للقائمة
        ...List.generate(itemCount, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // اسم الاختبار
                Container(
                  height: 11,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                // النتيجة
                Container(
                  height: 11,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
