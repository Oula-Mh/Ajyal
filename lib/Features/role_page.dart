import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF17284B), Color(0xFF17284B), Color(0xFF365EB1)],
            stops: [0.0, 0.75, 1.0],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(context).height / 1.1,
            decoration: BoxDecoration(
              color: AppColor.white1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "تابع تسجيل الدخول إلى تطبيق معهد ", // الجزء الأول
                      style: Styles.largeBlack.copyWith(height: 1.8),
                      children: [
                        TextSpan(
                          text: "  أجيال ", // الجزء المميز
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        TextSpan(
                          text: "باختيار أحد الأدوار :",
                          style: Styles.largeBlack,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRouter.loginPage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 208, 246, 255),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 0.2),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Text("طالب ضمن المعهد"),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.parentRgister);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 202, 220),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 0.2),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Text("ولي أمر الطالب"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
