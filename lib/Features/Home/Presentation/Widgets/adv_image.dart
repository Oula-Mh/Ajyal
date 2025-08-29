import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Custom/Custom_widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';

class ImageAdv extends StatelessWidget {
  final String imageUrl;
  const ImageAdv({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),

      child: Container(
        decoration: BoxDecoration(
          //  border: Border.all(),
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColor.primaryColor.withAlpha(150),
          //     offset: Offset(0, 1), // ظل باتجاه أسفل يمين
          //     blurRadius: 5,
          //     spreadRadius: 1,
          //   ),
          //],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: CacheImage(
            imageUrl: EndPoints.fileBaseUrl + imageUrl,
            height: 120,
            width: double.infinity,
            isStringExist: true,
          ),
          // child: Image.network(
          //   EndPoints.fileBaseUrl + imageUrl,
          //   height: 130,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          //   errorBuilder: (context, error, stackTrace) {
          //     return Container(
          //       height: 130,
          //       width: double.infinity,
          //       color: Colors.grey.shade200,
          //       alignment: Alignment.center,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: const [
          //           Icon(Icons.broken_image, size: 40, color: Colors.grey),
          //           SizedBox(height: 8),
          //           Text(
          //             'Image not found',
          //             style: TextStyle(color: Colors.grey),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
