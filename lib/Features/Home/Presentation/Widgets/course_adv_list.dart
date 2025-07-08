import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Home/Presentation/Widgets/adv_details_bttn.dart';
import 'package:ajyal/Features/Home/Presentation/Widgets/adv_image.dart';
import 'package:flutter/material.dart';

class CourseAdvListView extends StatelessWidget {
  final List<CourseAdvModel> mylist;
  const CourseAdvListView({super.key, required this.mylist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mylist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.54,
              decoration: BoxDecoration(
                color: AppColor.fillTextField,
                border: Border.all(color: AppColor.borderTextField),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة داخل كارد
                  ImageAdv(imageUrl: mylist[index].images![0].path!),
                  // العنوان
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      mylist[index].title!,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // التاريخ
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(width: 4),
                            Text(
                              formatDate(mylist[index].createdAt.toString()),
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        AdvDetailsBttn(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // : ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: 2, // Show 2 shimmer items
      //   itemBuilder: (context, index) {
      //     return const CourseAdvShimmer();
      //   },
      // ),
    );
  }
}
