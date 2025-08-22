import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class ParentChoiceItem extends StatelessWidget {
  final String itemText;
  final void Function() onTap;
  const ParentChoiceItem({
    super.key,
    required this.itemText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: AppColor.primaryColor, width: 4),
            ),
          ),
          child: Text(itemText),
        ),
      ),
    );
  }
}
