import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/profile_line_widget.dart';
import 'package:flutter/material.dart';

class StudentInfoPage extends StatelessWidget {
  final StudentProfileModel model;
  const StudentInfoPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: AppColor.white1,
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: AppColor.fillTextField,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "أنا أتعلم\n أطور نفسي\n وأصنع مستقبلي\n مع مركز أجيال ",
                    style: Styles.largeBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      height: 1.7,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: LineWidget(
                          header: "الاسم الأول",
                          value: model.data!.roleData!.firstName!,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: LineWidget(
                          header: "الاسم الثاني",
                          value: model.data!.roleData!.lastName!,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: LineWidget(
                          header: "اسم الأب",
                          value: model.data!.roleData!.fatherName ?? "-",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: LineWidget(
                          header: "اسم الأم",
                          value: model.data!.roleData!.motherName ?? "-",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  LineWidget(
                    header: "عنوان الطالب",
                    value: model.data!.roleData!.address!,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.001,
            left: 10,
            child: Image(
              height: 180,
              width: 180,
              image: AssetImage("assets/images/student.png"),
            ),
          ),
        ],
      ),
    );
  }
}
