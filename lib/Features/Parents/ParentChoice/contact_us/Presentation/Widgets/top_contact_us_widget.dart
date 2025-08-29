import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class TopContactUsWidget extends StatelessWidget {
  final Size size;
  const TopContactUsWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.primaryColor,
                  Color.fromARGB(255, 162, 222, 240),
                  AppColor.white1,
                ],
                stops: [0.0, 0.6, 1.0],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.transparent,
                child: Image.asset(AppImages.email),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
