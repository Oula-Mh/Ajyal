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
              "العلامة",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: const Color.fromARGB(255, 62, 133, 65),
                fontSize: 14.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...List.generate(quizList.length, (index) {
          final quiz = quizList[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${index + 1}. ${quiz.quizName}'),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 13),
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Text(
                  '${quiz.result.toInt()}/${quiz.maxScore}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.blueAccent),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
