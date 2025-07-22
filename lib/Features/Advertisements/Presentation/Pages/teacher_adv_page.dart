import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/bottom_teacher_part.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/circular_teacher_image.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/teacher_main_info.dart';
import 'package:flutter/material.dart';

class TeacherInfoPage extends StatelessWidget {
  const TeacherInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final containerHeight = screenHeight * 0.5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(height: screenHeight),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: containerHeight,
              width: double.infinity,
              child: Stack(
                children: [
                  // الصورة
                  // الطبقة الزرقاء الشفافة
                  Container(
                    height: containerHeight,
                    color: Colors.blue.withOpacity(0.5),
                  ),
                  Container(
                    height: containerHeight,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.frame),
                      ),
                    ),
                  ),

                  TeacherMainInfo(),
                ],
              ),
            ),
          ),

          // ClipPath لعمل الشكل المائل وتمتد لآخر الشاشة
          BottonTeacherPart(
            containerHeight: containerHeight,
            screenHeight: screenHeight,
          ),
          // الصورة الدائرية مع الإطارين
          CircularTeacherImage(containerHeight: containerHeight),
        ],
      ),
    );
  }
}

class SlantedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 90); // الميلان
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
