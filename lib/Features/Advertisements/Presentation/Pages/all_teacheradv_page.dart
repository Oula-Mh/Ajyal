import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:flutter/material.dart';

class AllTeacherPage extends StatelessWidget {
  final List<AdvModel> resultsList;
  const AllTeacherPage({super.key, required this.resultsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(context, "إعلان الاستاذ"));
  }
}
