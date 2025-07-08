import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Custom/Custom_widgets/cache_image_widget.dart';
import 'package:flutter/widgets.dart';

class AllCourseImage extends StatelessWidget {
  final String path;
  const AllCourseImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CacheImage(
          imageUrl: EndPoints.fileBaseUrl + path,
          height: 20,
          width: 30,
          isStringExist: false,
        ),
      ),
    );
  }
}
