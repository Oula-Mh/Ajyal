import 'package:flutter/material.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'show_more_text.dart';
import 'image_viewer_dialog.dart';

class ReplyCard extends StatelessWidget {
  final Reply reply;
  final bool expanded;
  final ValueChanged<bool> onToggleExpand;

  const ReplyCard({
    super.key,
    required this.reply,
    required this.expanded,
    required this.onToggleExpand,
  });

  @override
  Widget build(BuildContext context) {
    final isStudent = reply.authorType.toLowerCase().contains('student');
    final bubbleColor = isStudent
        ? AppColor.purple.withOpacity(0.1)
        : AppColor.primaryColor.withOpacity(0.1);
    final borderColor = isStudent ? AppColor.purple : AppColor.primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _authorInfo(isStudent, borderColor),
              const SizedBox(height: 12),
              ShowMoreText(
                text: reply.body,
                expanded: expanded,
                onToggle: onToggleExpand,
              ),
              if (reply.image != null) ...[
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () => showImageDialog(
                    context,
                    EndPoints.fileBaseUrl + reply.image!.path,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: EndPoints.fileBaseUrl + reply.image!.path,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => _placeholder(),
                      errorWidget: (_, __, ___) => _error(),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _authorInfo(bool isStudent, Color borderColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            isStudent ? 'طالب' : 'أستاذ',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, size: 16, color: borderColor),
              const SizedBox(width: 4),
              Text(
                reply.author.name,
                style: TextStyle(
                  color: borderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _placeholder() => Container(
        width: double.infinity,
        height: 160,
        color: Colors.grey.shade200,
        child: const Center(child: CircularProgressIndicator()),
      );

  Widget _error() => Container(
        width: double.infinity,
        height: 160,
        color: Colors.grey.shade200,
        child: const Icon(Icons.broken_image),
      );
}
