import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Community/Data/model/issue_list_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuestionCard extends StatelessWidget {
  final IssueModel question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// صف يحوي الدائرة + النص + الصورة
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // دائرة صغيرة (نقطة)
              Container(
                margin: const EdgeInsets.only(top: 6, right: 8),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10),
              // النص + الصورة جنب بعض
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // النص
                    Expanded(
                      child: Text(
                        question.body,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                          height: 1.7,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// الزر تحت السؤال
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.myQuestionPage);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColor.primaryColor,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          " السؤال والردود",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //    ElevatedButton.icon(
          //     onPressed: () {
          //       print('Navigate to view question page for ID: ${question.id}');
          //     },
          //     icon: const Icon(Icons.arrow_forward_ios, size: 14),
          //     label: const Text('عرض السؤال والإجابة',style: TextStyle(),),
          //     style: ElevatedButton.styleFrom(
          //       foregroundColor: AppColor.primaryColor,
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 20,
          //         vertical: 12,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12.0),
          //       ),
          //       elevation: 3.0,
          //       textStyle: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 14,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
