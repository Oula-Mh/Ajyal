import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/parent_page_choice.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/student_card_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ParentHome extends StatelessWidget {
  const ParentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 22),
                  child: Text(
                    "متابعة الطالب في معهد\n\t\t\t أجيال التعليمي",
                    style: Styles.meduimWhite.copyWith(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 5),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(AppImages.logo, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white1,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(130)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 5,
                ),
                child: Column(
                  children: [
                    StudentInfoCard(
                      studentName: "studentName",
                      studentClass: "studentClass",
                      // onAddStudents: () {},
                      // onQrPressed: () {},
                    ),
                    ParentPageChoice(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
