import 'dart:io';
import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatelessWidget {
  final dynamic imageProvider;

  const FullScreenImageViewer({super.key, required this.imageProvider});

  ImageProvider _getImage() {
    if (imageProvider is File) {
      return FileImage(imageProvider);
    } else if (imageProvider is String) {
      return NetworkImage(imageProvider);
    }
    return const AssetImage('assets/placeholder.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 1.0,
          maxScale: 4.0,
          child: Image(image: _getImage(), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
