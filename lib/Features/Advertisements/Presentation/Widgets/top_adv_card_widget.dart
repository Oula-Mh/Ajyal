import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemData {
  final String title;
  final String imagePath;

  ItemData(this.title, this.imagePath);
}

class TeacherAdvListView extends StatelessWidget {
  final List<ItemData> items = [
    ItemData('إ.سامر الشيخ', AppImages.logo),
    ItemData('إ.علي الطويل', AppImages.adv),
    ItemData('إ.صالح العلي', AppImages.adv),
  ];

  TeacherAdvListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.teacherInfoPage);
      },
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.teacherInfoPage);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(item.imagePath),
                ),
              ),
              width: 135,
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Card(
                      elevation: 15,
                      color: AppColor.secondaryColor.withOpacity(.80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
