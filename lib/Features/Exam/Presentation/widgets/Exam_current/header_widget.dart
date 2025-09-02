import 'package:ajyal/Features/Exam/utils/question_utils.dart';
import 'package:flutter/material.dart';
import '../Exam_current/submit_button.dart';
import '../Exam_current/timer_circle.dart';

class HeaderCurrentExam extends StatelessWidget {
  final AnimationController controller;
  final int timeLeft;
  final int totalTime;
  final VoidCallback onSubmit;
  final String name;

  const HeaderCurrentExam({
    super.key,
    required this.controller,
    required this.timeLeft,
    required this.totalTime,
    required this.onSubmit,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ).copyWith(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubmitButton(onConfirmed: onSubmit),
              TimerCircle(
                controller: controller,
                timeLeft: timeLeft,
                getTimerColor: () => getTimerColor(totalTime, timeLeft),
                formatTime: formatTime,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
