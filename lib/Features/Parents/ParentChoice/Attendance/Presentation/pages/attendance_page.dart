import 'dart:core';

import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Model/attendence_model.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Presentation/bloc/Attendence/attendence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AttendanceClalenderPage extends StatefulWidget {
  const AttendanceClalenderPage({super.key});

  @override
  State<AttendanceClalenderPage> createState() => _AttendanceCalendarState();
}

class _AttendanceCalendarState extends State<AttendanceClalenderPage> {
  DateTime currentMonth = DateTime.now();

  // حدود الدورة (مثال: 5 تموز حتى 10 تشرين الثاني)
  // final DateTime startDate = DateTime(DateTime.now().year, 7, 5);
  // final DateTime endDate = DateTime(DateTime.now().year, 11, 10);

  final List<String> weekDays = [
    "الأحد",
    "الاثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
  ];

  @override
  Widget build(BuildContext context) {
    CourseAbsenceModel model;
    int daysInMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

    List<int> absenceDays = [];

    //   widget.absenceDaysPerMonth[currentMonth.month] ?? [];

    // // اليوم الأول بالشهر (يعطي رقم يوم الأسبوع 0=الإثنين عادة بالـintl، بدنا نخلي الأحد=0)
    int firstWeekdayOfMonth =
        DateTime(currentMonth.year, currentMonth.month, 1).weekday % 7;

    return BlocConsumer<AttendenceCubit, AttendenceState>(
      listener: (context, state) {
        if (state is GetAllAttendenceDays) {
          model = state.model;
          Map<int, List<int>> myDay = buildAbsenceDaysPerMonth(
            state.model.absenceDays,
          );
          absenceDays = myDay[currentMonth] ?? [];
        }
      },
      builder: (context, state) {
        return state is GetAllAttendenceDays
            ? Scaffold(
              backgroundColor: AppColor.primaryColor,
              appBar: AppBar(
                title: Text(DateFormat.yMMMM('ar').format(currentMonth)),
                centerTitle: true,
                backgroundColor: AppColor.primaryColor,
                titleTextStyle: Styles.largeWhite,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white),
                    onPressed: () {
                      if (currentMonth.isBefore(
                        DateTime(
                          state.model.course.startDate.year,
                          state.model.course.endDate.month,
                          1,
                        ),
                      )) {
                        setState(() {
                          currentMonth = DateTime(
                            currentMonth.year,
                            currentMonth.month + 1,
                            1,
                          );
                        });
                      }
                    },
                  ),
                ],
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    if (currentMonth.isAfter(
                      DateTime(
                        state.model.course.startDate.year,
                        state.model.course.startDate.month,
                        1,
                      ),
                    )) {
                      setState(() {
                        currentMonth = DateTime(
                          currentMonth.year,
                          currentMonth.month - 1,
                          1,
                        );
                      });
                    }
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white1,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // صف أيام الأسبوع
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:
                              weekDays
                                  .map(
                                    (d) => Expanded(
                                      child: Center(
                                        child: Text(
                                          d,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // الشبكة
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 7, // 7 أيام الأسبوع
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                          itemCount: daysInMonth + firstWeekdayOfMonth,
                          itemBuilder: (context, index) {
                            if (index < firstWeekdayOfMonth) {
                              // فراغ قبل بداية الشهر
                              return const SizedBox.shrink();
                            }

                            int day = index - firstWeekdayOfMonth + 1;
                            DateTime thisDay = DateTime(
                              currentMonth.year,
                              currentMonth.month,
                              day,
                            );

                            bool isFuture = thisDay.isAfter(DateTime.now());
                            bool isAbsent = absenceDays.contains(day);
                            bool isOutOfRange =
                                thisDay.isBefore(
                                  state.model.course.startDate,
                                ) ||
                                thisDay.isAfter(state.model.course.endDate);

                            // محتوى الوسط
                            Widget centerChild = const SizedBox.shrink();
                            if (!isOutOfRange) {
                              if (isFuture) {
                                centerChild = const SizedBox.shrink(); // فاضي
                              } else if (isAbsent) {
                                centerChild = const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                );
                              } else {
                                centerChild = const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                );
                              }
                            }

                            return Container(
                              decoration: BoxDecoration(
                                color:
                                    isOutOfRange
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Stack(
                                children: [
                                  // رقم اليوم في الزاوية
                                  Positioned(
                                    top: 4,
                                    left: 4,
                                    child: Text(
                                      "$day",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            isOutOfRange
                                                ? Colors.grey
                                                : Colors.black,
                                      ),
                                    ),
                                  ),
                                  // محتوى الوسط (صح/خطأ/فاضي)
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(child: centerChild),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Divider(color: Colors.grey.shade400),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // border: Border.all(color: AppColor.purple),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "عدد أيام الغياب الكلي : 10",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            : Scaffold();
      },
    );
  }
}
