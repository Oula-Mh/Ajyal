import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:flutter/material.dart';

class CustomAnalysAppbar extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAnalysAppbar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final selectedName = getit<CacheHelper>().getData(
      key: "selectedCourseName",
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "     تقدمي في $selectedName ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
            height: 2,
          ),
        ),
      ],
    );
  }
}
