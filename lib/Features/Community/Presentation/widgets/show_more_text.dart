import 'package:flutter/material.dart';

class ShowMoreText extends StatelessWidget {
  final String text;
  final bool expanded;
  final ValueChanged<bool> onToggle;

  const ShowMoreText({
    super.key,
    required this.text,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    const cutoff = 220;
    if (text.length <= cutoff) {
      return Text(text, style: const TextStyle(height: 1.4));
    }
    final display = expanded ? text : '${text.substring(0, cutoff)}...';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(display, style: const TextStyle(height: 1.4)),
        GestureDetector(
          onTap: () => onToggle(!expanded),
          child: Text(
            expanded ? 'عرض أقل' : 'عرض المزيد',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
