import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:flutter/material.dart';

class ImageGalleryPage extends StatefulWidget {
  final List<Images> images;

  const ImageGalleryPage({super.key, required this.images});

  @override
  State<ImageGalleryPage> createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController()..addListener(() {
          int newIndex = _pageController.page?.round() ?? 0;
          if (_currentIndex != newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          }
        });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalImages = widget.images.length;

    return Scaffold(
      appBar: customAppBar(context, "كل الصور"),
      backgroundColor: AppColor.white1,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: totalImages,
            itemBuilder: (context, index) {
              return InteractiveViewer(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.network(
                      EndPoints.fileBaseUrl + widget.images[index].path!,
                      fit: BoxFit.contain,

                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppImages.notFound,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'الصورة ${_currentIndex + 1} من $totalImages',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
