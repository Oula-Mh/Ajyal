import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Model/attendence_model.dart';
import 'package:dio/dio.dart';
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

String formatTime(String inputTime) {
  // Parse the string into a DateTime object
  final parsedDate =
      DateTime.parse(inputTime).toLocal(); // toLocal() for local timezone

  // Format to 12-hour time with AM/PM
  final formattedTime = DateFormat('hh:mm a').format(parsedDate);
  return formattedTime;
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

ServerFailure handleException(Exception e) {
  if (e is DioException) {
    return ServerFailure.fromDioError(e);
  }
  return ServerFailure(e.toString());
}

void showVarianceDialog(BuildContext context, double variancePercentage) {
  String level = '';
  String advice = '';
  Color levelColor = Colors.green;

  if (variancePercentage < 15) {
    level = 'ثابت ومستقر ✅';
    advice = 'أداءك ممتاز، حافظ على نفس أسلوب الدراسة.';
    levelColor = Colors.green;
  } else if (variancePercentage < 30) {
    level = 'متوسط ⚠️';
    advice = 'حاول تحلل أسباب انخفاض بعض الدرجات وتركّز على المراجعة.';
    levelColor = Colors.orange;
  } else {
    level = 'متفاوت ❌';
    advice = 'درجاتك غير مستقرة. نظم وقتك وراجع بانتظام.';
    levelColor = Colors.red;
  }

  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'تحليل نسبة التباين',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' نسبة التباين توضح مدى استقرار أدائك عبر الامتحانات.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 12),
              Text(
                '📊 التصنيفات:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text('• أقل من 15%: ثابت ومستقر  ✅'),
              Text('• بين 15% و 30%: متوسط  ⚠️'),
              Text('• أكثر من 30%: متفاوت  ❌'),
              const Divider(height: 24),
              Text(
                '📈 نسبتك الحالية: ${variancePercentage.toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(' التقييم: '),
                  Text(
                    level,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: levelColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                color: AppColor.white1,
                padding: EdgeInsets.all(12),
                child: Text(
                  advice,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('إغلاق'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
  );
}

Map<int, List<int>> buildAbsenceDaysPerMonth(List<AbsenceDay> absenceDays) {
  final Map<int, List<int>> absenceDaysPerMonth = {};

  for (var day in absenceDays) {
    final int month = day.absenceDate.month;
    final int dayNum = day.absenceDate.day;

    if (!absenceDaysPerMonth.containsKey(month)) {
      absenceDaysPerMonth[month] = [];
    }
    absenceDaysPerMonth[month]!.add(dayNum);
  }

  return absenceDaysPerMonth;
}
