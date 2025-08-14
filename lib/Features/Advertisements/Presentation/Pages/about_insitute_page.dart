import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/top_adv_card_widget.dart';
import 'package:flutter/material.dart';

class AboutInstitutePage extends StatelessWidget {
  const AboutInstitutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "عن المعهد"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(children: [TeacherAdvListView()]),
      ),
    );
  }
}
