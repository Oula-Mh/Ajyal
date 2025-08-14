import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title, style: TextStyle(color: Colors.white)),
    backgroundColor: AppColor.primaryColor,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back),
      color: AppColor.white1,
    ),
  );
}
