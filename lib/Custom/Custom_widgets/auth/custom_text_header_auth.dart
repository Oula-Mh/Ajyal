import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextHeaderAuth extends StatelessWidget {
  CustomTextHeaderAuth({required this.text, super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Text("أهلاً و سهلاً .. !", style: Styles.largeWhite),
        SizedBox(height: 10),
        Text(text, style: Styles.meduimGray),
        SizedBox(height: 50),
      ],
    );
  }
}
