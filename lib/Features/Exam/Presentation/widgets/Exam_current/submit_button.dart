import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/utils/question_utils.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onConfirmed;

  const SubmitButton({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool confirmed = await showConfirmDialog(
          context: context,
          title: "إنهاء الاختبار",
          content: "هل أنت متأكد أنك تريد إنهاء الاختبار؟",
        );
        if (confirmed) {
          onConfirmed();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: const Text(
        "إنهاء الاختبار",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
