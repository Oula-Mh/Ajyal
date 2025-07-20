import 'package:ajyal/Features/Course/Presentation/Widget/label_date_widget.dart';
import 'package:flutter/widgets.dart';

class SubcourseDetails2 extends StatelessWidget {
  final String start;
  final String end;
  final String capacity;
  const SubcourseDetails2({
    super.key,
    required this.start,
    required this.end,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 11,
      children: [
        LabeledDateBox(label: "يبدأ : ", date: start, isDate: true),
        LabeledDateBox(label: "ينتهي : ", date: end, isDate: true),
        LabeledDateBox(
          label: "السعة : ",
          date: end,
          isDate: false,
          count: capacity,
        ),
      ],
    );
  }
}
