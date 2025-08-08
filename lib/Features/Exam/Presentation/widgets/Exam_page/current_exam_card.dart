import 'dart:async';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CurrentExamCard extends StatelessWidget {
  final ExamCurrentModel exam;
  final VoidCallback onStartExam;

  const CurrentExamCard({
    super.key,
    required this.exam,
    required this.onStartExam,
  });

  Stream<Duration> _timeStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      final now = DateTime.now();
      if (now.isBefore(exam.startTime)) {
        yield exam.startTime.difference(now);
      } else if (now.isBefore(exam.endTime)) {
        yield now.difference(exam.startTime);
      } else {
        yield Duration.zero;
        break;
      }
    }
  }

  String _formatDurationSmart(Duration d) {
    if (d.inDays >= 1) {
      final days = d.inDays;
      final hours = d.inHours.remainder(24);
      return '${days} يوم${days > 1 ? 'ان' : ''} و $hours ساعة';
    } else {
      final h = d.inHours;
      final m = d.inMinutes.remainder(60);
      final s = d.inSeconds.remainder(60);
      return '${h.toString().padLeft(2, '0')}:'
          '${m.toString().padLeft(2, '0')}:'
          '${s.toString().padLeft(2, '0')}';
    }
  }

  Color _progressColor(bool hasEnded, bool canEnter) {
    if (hasEnded) return Colors.redAccent;
    if (canEnter) return Colors.green;
    return Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context) {
    final totalSeconds =
        exam.endTime.difference(exam.startTime).inSeconds.toDouble();

    return StreamBuilder<Duration>(
      stream: _timeStream(),
      initialData: () {
        final now = DateTime.now();
        if (now.isBefore(exam.startTime)) {
          return exam.startTime.difference(now);
        } else if (now.isBefore(exam.endTime)) {
          return now.difference(exam.startTime);
        } else {
          return Duration.zero;
        }
      }(),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final hasEnded = now.isAfter(exam.endTime);
        final canEnter = now.isAfter(exam.startTime) && !hasEnded;

        final time = snapshot.data ?? Duration.zero;

        double progress;
        if (now.isBefore(exam.startTime)) {
          progress = 0.0;
        } else if (canEnter) {
          progress = time.inSeconds / totalSeconds;
        } else {
          progress = 1.0;
        }

        return Card(
          elevation: 1,
          color: AppColor.white1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Icon(
                      canEnter
                          ? Icons.access_time_filled
                          : Icons.hourglass_bottom,
                      color:
                          hasEnded
                              ? Colors.red
                              : (canEnter ? Colors.green : Colors.orange),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        hasEnded
                            ? "انتهى الامتحان"
                            : canEnter
                            ? "مضى: ${_formatDurationSmart(time)}"
                            : "الوقت المتبقي: ${_formatDurationSmart(time)}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // شريط التقدم
                LinearPercentIndicator(
                  lineHeight: 6,
                  percent: progress.clamp(0.0, 1.0),
                  backgroundColor: Colors.grey.shade300,
                  progressColor: _progressColor(hasEnded, canEnter),
                  barRadius: const Radius.circular(8),
                ),
                const SizedBox(height: 16),

                // زر البدء أو انتهاء الوقت (في الأسفل)
                Align(
                  alignment: Alignment.centerRight,
                  child:
                      canEnter
                          ? ElevatedButton.icon(
                            onPressed: onStartExam,
                            icon: const Icon(
                              Icons.login,
                              size: 20,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "ابدأ الامتحان",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 2,
                            ),
                          )
                          : hasEnded
                          ? Text(
                            "انتهى الوقت",
                            style: TextStyle(
                              color: Colors.redAccent.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )
                          : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
