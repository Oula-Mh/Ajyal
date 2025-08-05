import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:flutter/material.dart';

class NameAndScoreList extends StatelessWidget {
  final List<QuizItem> quizList;
  const NameAndScoreList({super.key, required this.quizList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "الاختبارات : ",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
            Text(
              "${quizList.length} اختبار",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.primaryColor,
                fontSize: 14.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...List.generate(quizList.length, (index) {
          final quiz = quizList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${index + 1}. ${quiz.quizName}'),
                Text(
                  '${double.parse(quiz.result).toInt()}/${quiz.maxScore}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.blueAccent),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
