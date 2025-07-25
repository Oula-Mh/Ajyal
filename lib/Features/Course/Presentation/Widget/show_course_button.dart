import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Course/Presentation/Pages/image_gallery.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShowCourseBttn extends StatelessWidget {
  final int? id;
  final List<Images> images;
  final bool isGeneral;
  const ShowCourseBttn({
    super.key,
    @required this.id,
    required this.images,
    required this.isGeneral,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isGeneral
              ? Container()
              : GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    AppRouter.courseDetailsPage,
                    extra: {'id': id, 'images': images},
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "تفاصيل",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          SizedBox(height: 18),
          //   Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImageGalleryPage(images: images),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(6),
              ),
              child:
                  isGeneral
                      ? Text(
                        " عرض\n الصور",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : Text(
                        "الصور",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
