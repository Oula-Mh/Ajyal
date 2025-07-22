import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:flutter/material.dart';

class ImageRow extends StatelessWidget {
  final List<Images> images;
  const ImageRow({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final int maxVisible = 3;
    final int extraImages = images.length - maxVisible;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount:
                    images.length > maxVisible ? maxVisible : images.length,
                separatorBuilder: (_, __) => SizedBox(width: 7),
                itemBuilder: (context, index) {
                  final imageUrl = EndPoints.fileBaseUrl + images[index].path!;

                  Widget imageWidget = Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppImages.notFound,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                  if (index == maxVisible - 1 && extraImages > 0) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Opacity(opacity: 0.6, child: imageWidget),
                        ),
                        Positioned.fill(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              '+$extraImages',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 4),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  // صورة عادية
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: imageWidget,
                  );
                },
              ),
            ),
          ),

          // زر "عرض"
          //   Text(".. عرض", style: TextStyle(color: Colors.blue)),
          // TextButton(
          //   onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => ImageGalleryPage(images: images),
          //   ),
          // );
          //   },
          //   child: Text(".. عرض", style: TextStyle(color: Colors.blue)),
          // ),
        ],
      ),
    );
  }
}
