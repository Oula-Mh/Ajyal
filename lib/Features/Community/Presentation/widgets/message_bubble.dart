import 'dart:io';
import 'package:flutter/material.dart';
import 'full_screen_image_viewer.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isTeacher;
  final dynamic image;
  final bool isMainQuestion;

  const MessageBubble({
    required this.text,
    required this.isTeacher,
    this.image,
    this.isMainQuestion = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget? imageWidget;
    if (image != null) {
      ImageProvider imageProvider =
          (image is File) ? FileImage(image) : NetworkImage(image as String);

      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          image: imageProvider,
          width: 220,
          height: 220,
          fit: BoxFit.cover,
        ),
      );
    }

    return Column(
      crossAxisAlignment:
          isTeacher ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        if (isMainQuestion)
          const Padding(
            padding: EdgeInsets.only(right: 25, bottom: 4, top: 5),
            child: Align(
              child: Text(
                "السؤال الرئيسي",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        Align(
          alignment: isTeacher ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isTeacher ? const Color(0xFFE2ECF8) : const Color(0xFF3C4C88),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
                bottomLeft: isTeacher ? const Radius.circular(0) : const Radius.circular(18),
                bottomRight: isTeacher ? const Radius.circular(18) : const Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (imageWidget != null)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FullScreenImageViewer(imageProvider: image),
                        ),
                      );
                    },
                    child: imageWidget,
                  ),
                if (text.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: image != null ? 8.0 : 0),
                    child: Text(
                      text,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: isTeacher ? const Color(0xFF2F4170) : Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
