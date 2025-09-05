import 'package:flutter/material.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'show_more_text.dart';
import 'image_viewer_dialog.dart';

class IssueCard extends StatelessWidget {
  final IssueData issue;
  final bool expanded;
  final ValueChanged<bool> onToggleExpand;

  const IssueCard({
    super.key,
    required this.issue,
    required this.expanded,
    required this.onToggleExpand,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = issue.image?.path.isNotEmpty ?? false;
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Container(
        width: double.infinity, // ✅ تمتد على عرض الشاشة
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity, // ✅ النص يتمدد كمان
              child: ShowMoreText(
                text: issue.body,
                expanded: expanded,
                onToggle: onToggleExpand,
              ),
            ),
            if (hasImage) ...[
              const SizedBox(height: 10),
              GestureDetector(
                onTap:
                    () => showImageDialog(
                      context,
                      EndPoints.fileBaseUrl + issue.image!.path,
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: EndPoints.fileBaseUrl + issue.image!.path,
                    height: 160,
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
    );
  }

  Widget _header() {
    return Container(
      // width: double.infinity, // ✅ العنوان كمان يغطي العرض
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Row(
        children: [
          Icon(Icons.push_pin, size: 16, color: Colors.orange),
          SizedBox(width: 4),
          Text('السؤال الرئيسي', style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }

  Widget _placeholder() => Container(
    height: 160,
    width: double.infinity,
    color: Colors.grey.shade200,
    child: const Center(child: CircularProgressIndicator()),
  );

  Widget _error() => Container(
    height: 160,
    width: double.infinity,
    color: Colors.grey.shade200,
    child: const Icon(Icons.broken_image),
  );
}
