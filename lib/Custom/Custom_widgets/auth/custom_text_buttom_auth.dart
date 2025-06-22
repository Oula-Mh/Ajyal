import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButtomAuth extends StatelessWidget {
  CustomTextButtomAuth({
    required this.one,
    required this.tow,
    required this.onTap,
    super.key,
  });
  String one;
  String tow;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(one),
            GestureDetector(
              onTap: onTap,
              child: Text(
                tow,
                style: TextStyle(color: AppColor.primaryColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
