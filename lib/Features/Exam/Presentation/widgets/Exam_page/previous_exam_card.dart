// import 'package:ajyal/Core/routes/route_constant.dart';
// import 'package:ajyal/Core/styles/app_color.dart';
// import 'package:ajyal/Features/Exam/data/model/exam_pre_model.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:go_router/go_router.dart';

// class PreviousExamCard extends StatelessWidget {
//   final ExamPreModel result;

//   const PreviousExamCard({super.key, required this.result});
//   Color getColor(double score) {
//     if (score >= 90) return Colors.green;
//     if (score >= 60) return Colors.orange;
//     return Colors.red;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DateTime startTime = DateTime.parse(result.startTime);

//     final double durationInMinutes = double.tryParse(result.duration) ?? 0;
//     final DateTime endTime = startTime.add(
//       Duration(minutes: durationInMinutes.toInt()),
//     );

//     final DateTime now = DateTime.now();

//     final bool examFinished =
//         now.isAfter(endTime) || now.isAtSameMomentAs(endTime);
//     final bool resultAvailable = result.studentQuiz.result != null;

//     final bool canOpen = examFinished && resultAvailable;

//     return GestureDetector(
//       onTap:
//           canOpen
//               ? () {
//                 GoRouter.of(context).push(
//                   AppRouter.previousExamPage,
//                   extra: {
//                     'id': result.studentQuiz.quizId,
//                     'nameExam': result.name,
//                   },
//                 );
//               }
//               : null,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 8),
//         child: Card(
//           color: canOpen ? AppColor.white1 : Colors.grey.shade200,
//           elevation: 1,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 27),
//                       child: Text(
//                         result.name,
//                         style: const TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.date_range,
//                           size: 18,
//                           color: Color.fromARGB(255, 184, 138, 168),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           "${startTime.toLocal().toString().split(' ').first} - ${startTime.toLocal().toString().split(' ').last.substring(0, 8)}",
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         const Icon(
//                           Iconsax.clock,
//                           size: 18,
//                           color: Color.fromARGB(255, 184, 138, 168),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(
//                           "مدة الامتحان : ${result.duration}",
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),

//                 result.studentQuiz.result != null
//                     ? CircularPercentIndicator(
//                       radius: 32.0,
//                       lineWidth: 8.0,
//                       percent: result.studentQuiz.result! / 100,
//                       center: Text(
//                         "${result.studentQuiz.result}%",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: getColor(result.studentQuiz.result!),
//                         ),
//                       ),
//                       progressColor: getColor(result.studentQuiz.result!),
//                       backgroundColor: Colors.grey.shade200,
//                       circularStrokeCap: CircularStrokeCap.round,
//                       animation: true,
//                     )
//                     : const Text(
//                       "قيد المعالجة",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:go_router/go_router.dart';

class PreviousExamCard extends StatelessWidget {
  final ExamPreModel result;

  const PreviousExamCard({super.key, required this.result});

  Color getColor(double score) {
    if (score >= 90) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime startTime = DateTime.parse(result.startTime);

    final double durationInMinutes = double.tryParse(result.duration) ?? 0;
    final DateTime endTime = startTime.add(
      Duration(minutes: durationInMinutes.toInt()),
    );

    final DateTime now = DateTime.now();

    final bool examFinished =
        now.isAfter(endTime) || now.isAtSameMomentAs(endTime);
    final bool resultAvailable = result.studentQuiz.result != null;

    final bool canOpen = examFinished && resultAvailable;

    return GestureDetector(
      onTap: () {
        if (canOpen) {
          GoRouter.of(context).push(
            AppRouter.previousExamPage,
            extra: {'id': result.studentQuiz.quizId, 'nameExam': result.name},
          );
        } else {
          // تحديد الرسالة حسب الحالة
          String message;
          if (!examFinished) {
            message = "لا يمكن الدخول إلا بعد انتهاء وقت الاختبار.";
          } else if (!resultAvailable) {
            message = "النتيجة غير متوفرة بعد، يرجى الانتظار.";
          } else {
            message = "لا يمكن الدخول حالياً.";
          }

          // إظهار SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ), // مسافة من الحواف
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ), // padding داخلي
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
          color: canOpen ? AppColor.white1 : Colors.grey.shade200,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 27),
                      child: Text(
                        result.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          size: 18,
                          color: Color.fromARGB(255, 184, 138, 168),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${startTime.toLocal().toString().split(' ').first} - ${startTime.toLocal().toString().split(' ').last.substring(0, 8)}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.clock,
                          size: 18,
                          color: Color.fromARGB(255, 184, 138, 168),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "مدة الامتحان : ${result.duration}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                result.studentQuiz.result != null
                    ? CircularPercentIndicator(
                      radius: 32.0,
                      lineWidth: 8.0,
                      percent: result.studentQuiz.result! / 100,
                      center: Text(
                        "${result.studentQuiz.result}%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: getColor(result.studentQuiz.result!),
                        ),
                      ),
                      progressColor: getColor(result.studentQuiz.result!),
                      backgroundColor: Colors.grey.shade200,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                    )
                    : const Text(
                      "قيد المعالجة",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
