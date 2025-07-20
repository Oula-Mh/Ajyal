import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Custom/Custom_widgets/cache_image_widget.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<Images> imageUrls;
  const ImageSlider({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        height: MediaQuery.of(context).size.height * .32,
        width: double.infinity,
        child: AnotherCarousel(
          images:
              imageUrls
                  .map(
                    (image) => CacheImage(
                      imageUrl: EndPoints.fileBaseUrl + image.path!,
                      width: MediaQuery.of(context).size.height * .32,
                      height: double.infinity,
                      isStringExist: false,
                    ),
                  )
                  .toList(),
          dotSize: 6,
          autoplay: false,
          dotBgColor: Colors.transparent,
          indicatorBgPadding: 7,
        ),
      ),
    );
  }
}
