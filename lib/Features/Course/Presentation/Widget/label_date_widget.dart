import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LabeledDateBox extends StatelessWidget {
  final String label;
  final String date;
  final bool isDate;
  final String? count;

  const LabeledDateBox({
    super.key,
    required this.label,
    required this.date,
    required this.isDate,
    @required this.count,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(date);
    String formatted = DateFormat('d - MMMM', 'ar').format(dateTime);

    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        height: 90,
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondaryColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            SizedBox(height: 7),
            Text(
              isDate ? formatted : count!,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
