import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdvDetailsBttn extends StatelessWidget {
  final int courseId;
  final List<Images> images;
  const AdvDetailsBttn({
    super.key,
    required this.courseId,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.courseDetailsPage,
          extra: {'id': courseId, 'images': images},
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColor.primaryColor,
        ),
      ),
      // child: const Icon(
      //   Icons.arrow_forward_ios,
      //   size: 16,
      //   color: AppColor.primaryColor,
      // ),
    );
    // Padding(
    //   padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12),
    //   child: GestureDetector(
    //     onTap: () {
    //       GoRouter.of(context).push(AppRouter.allCoursePage);
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: AppColor.secondaryColor.withAlpha(230),
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           const Text(
    //             "تفاصيل",
    //             style: TextStyle(
    //               color: AppColor.primaryColor,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 16,
    //             ),
    //           ),
    //           SizedBox(width: 17),
    // Container(
    //   decoration: BoxDecoration(
    //     color: AppColor.secondaryColor,
    //     shape: BoxShape.circle,
    //   ),
    //   padding: const EdgeInsets.all(8),
    //   child: const Icon(
    //     Icons.arrow_forward_ios,
    //     size: 16,
    //     color: AppColor.primaryColor,
    //   ),
    // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
