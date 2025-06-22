import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customAlert(BuildContext context, String mssg, Function()? onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(mssg),
        actions: [TextButton(onPressed: onPressed, child: Text("OK"))],
      );
    },
  );
}

void showLogoutDialog(BuildContext context, Function()? onPressed) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("تسجيل الخروج", textAlign: TextAlign.center),
        content: Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: Navigator.of(context).pop,
            child: Text("إلغاء", style: TextStyle(color: AppColor.black1)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
            child: Text("نعم", style: TextStyle(color: AppColor.white1)),
          ),
        ],
      );
    },
  );
}
