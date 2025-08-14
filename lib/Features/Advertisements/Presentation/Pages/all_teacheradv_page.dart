import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/all_teacher_item.dart';
import 'package:flutter/material.dart';

class AllTeacherPage extends StatelessWidget {
  final List<AdvModel> resultsList;
  const AllTeacherPage({super.key, required this.resultsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "إعلان الاستاذ"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, right: 30),
            child: Text(
              "يوجد ${resultsList.length} إعلان",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            child: AllTeacherItem(
              itemCount: resultsList.length,
              courses: resultsList,
            ),
          ),
        ],
      ),
    );
  }
}
