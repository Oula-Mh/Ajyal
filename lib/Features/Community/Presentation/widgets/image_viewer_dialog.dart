import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void showImageDialog(BuildContext context, String url) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: InteractiveViewer(
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.contain,
            placeholder: (_, __) => Container(
              width: double.infinity,
              height: 400,
              color: Colors.grey.shade200,
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (_, __, ___) => Container(
              width: double.infinity,
              height: 400,
              color: Colors.grey.shade200,
              child: const Icon(Icons.broken_image, size: 80),
            ),
          ),
        ),
      ),
    ),
  );
}
