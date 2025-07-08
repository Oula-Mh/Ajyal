import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

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

Widget getSvg(String svg) {
  return SvgPicture.asset(
    svg,
    width: 70,
    height: 70, // optional tint
  );
}

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  return DateFormat('dd-MM-yyyy').format(dateTime);
}

Widget paginationHelper({
  required bool condition,
  required void fun,
  required IconData mainIcon,
}) {
  return condition
      ? IconButton(
        onPressed: () {
          fun;
        },
        icon: Icon(mainIcon),
      )
      : Icon(mainIcon, color: Colors.grey);
}
