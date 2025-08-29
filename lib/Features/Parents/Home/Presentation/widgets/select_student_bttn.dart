import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class SelectStudentBttn extends StatelessWidget {
  final bool selectedList;
  final void Function() onPressed;
  const SelectStudentBttn({
    super.key,
    required this.selectedList,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //   onPressed: () {
          //   setState(() {
          //     selectedList = true;
          //   });
          // },
          //   icon: Icon(Icons.menu),
          // ),
          selectedList
              ? MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 1,
                  ),
                ),
                onPressed: onPressed,
                child: Text(" تم "),
              )
              : MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 2,
                  ),
                ),
                onPressed: onPressed,
                child: Text(" اختيار طالب "),
              ),
        ],
      ),
    );
  }
}
