import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubCourseDetails extends StatelessWidget {
  final String type;
  final String cost;
  const SubCourseDetails({super.key, required this.type, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Icon(Icons.circle, size: 10, color: AppColor.purple),
              SizedBox(width: 5),
              Text(type),
            ],
          ),
        ),
        SizedBox(width: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Row(
            children: [
              Icon(Icons.circle, size: 10, color: AppColor.purple),
              SizedBox(width: 5),
              Text("التكلفة : $cost ل.س"),
            ],
          ),
        ),
      ],
    );
  }
}
