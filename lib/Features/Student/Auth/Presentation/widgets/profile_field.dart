import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final IconData iconData;
  final Color color;
  final bool isNeedArrow;
  const ProfileField({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconData,
    required this.color,
    required this.isNeedArrow,
  });

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(25),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(child: Icon(iconData, size: 30, color: color)),
      ),
      SizedBox(width: 18),
      Text(text),
    ];
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          height: 60,
          padding: EdgeInsets.only(left: 15, right: 10),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: children),
              isNeedArrow
                  ? Transform.flip(
                    flipX: true, // يعكس الأيقونة أفقياً
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.grey),
                  )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
