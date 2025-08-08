import 'package:flutter/material.dart';

class TimerCircle extends StatelessWidget {
  final AnimationController controller;
  final int timeLeft;
  final Color Function() getTimerColor;
  final String Function(int) formatTime;

  const TimerCircle({
    super.key,
    required this.controller,
    required this.timeLeft,
    required this.getTimerColor,
    required this.formatTime,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return CircularProgressIndicator(
                value: 1 - controller.value,
                strokeWidth: 9,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(getTimerColor()),
              );
            },
          ),
        ),
        Text(
          formatTime(timeLeft),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: getTimerColor(),
          ),
        ),
      ],
    );
  }
}
