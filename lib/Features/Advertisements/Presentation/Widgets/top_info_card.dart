import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:go_router/go_router.dart';

class TopInfoCard extends StatelessWidget {
  const TopInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.fillTextField,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryColor),
        ),
        width: double.infinity,
        height: 110,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                AppImages.withoutText,
                height: 70,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مركز أجيال التعليمي",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.rolePage);
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "عن المعهد",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: const [
                //     Icon(Iconsax.location, size: 17, color: Color(0xFFA38097)),
                //     SizedBox(width: 5),
                //     Text(
                //       'جرمانا - دخلة الوكالة - بناء لافي الدكاك',
                //       style: TextStyle(fontSize: 12, color: Colors.black54),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
