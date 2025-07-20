import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ShowCourseBttn extends StatelessWidget {
  final int id;
  final List<Images> images;
  const ShowCourseBttn({super.key, required this.id, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.courseDetailsPage,
              extra: {'id': id, 'images': images},
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "  الكورس",
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              " الصور",
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
