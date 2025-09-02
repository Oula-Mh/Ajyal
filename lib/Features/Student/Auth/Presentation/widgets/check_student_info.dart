import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:flutter/material.dart';

class CheckStudentInfo extends StatelessWidget {
  final CheckStudentInfoModel model;
  const CheckStudentInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "الطالب /ة: ",
              style: Styles.meduimWhite.copyWith(color: AppColor.black1),
            ),
            Text(
              "${model.data!.firstName} ${model.data!.lastName}",
              style: Styles.largeWhite.copyWith(color: AppColor.primaryColor),
            ),
          ],
        ),
        Text(
          "الصف : ${model.data!.classLevel}",
          style: Styles.meduimWhite.copyWith(color: AppColor.black1),
        ),
        SizedBox(height: 20),
        Text(
          "لقد تم تأكيد هويتك بنجاح ",
          style: Styles.meduimWhite.copyWith(color: AppColor.black1),
        ),
        Text(
          " قم بتعيين كلمة مرور من أجل حماية حسابك ",
          style: TextStyle(color: AppColor.borderTextField, height: 2.2),
        ),
      ],
    );
  }
}
