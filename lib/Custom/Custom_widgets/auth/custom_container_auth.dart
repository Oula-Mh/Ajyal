import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainerAuth extends StatelessWidget {
  CustomContainerAuth({this.child, super.key});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 26,
            right: 26,
            top: 50,
            bottom: 10,
          ),
          child: child,
        ),
      ),
    );
  }
}
