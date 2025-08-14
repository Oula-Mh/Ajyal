import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CacheImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final bool isStringExist;
  const CacheImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.isStringExist,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: height,
              color: Colors.white,
            ),
          ),
      errorWidget:
          (context, url, error) => Container(
            height: height,
            width: width,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.broken_image, size: 40, color: Colors.grey),
                SizedBox(height: 8),
                isStringExist
                    ? Text(
                      'Image not found',
                      style: TextStyle(color: Colors.grey),
                    )
                    : SizedBox(),
              ],
            ),
          ),
      imageBuilder:
          (context, imageProvider) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
    );
  }

  void _deleteCachedImage() {
    CachedNetworkImage.evictFromCache(imageUrl);
  }
}
