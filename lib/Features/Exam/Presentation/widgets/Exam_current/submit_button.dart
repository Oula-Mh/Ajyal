import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onConfirm;

  const SubmitButton({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("إنهاء الاختبار"),
            content: const Text("هل أنت متأكد أنك تريد إنهاء الاختبار؟"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("إلغاء"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                child: const Text("نعم"),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: const Text("إنهاء الاختبار", style: TextStyle(color: Colors.white)),
    );
  }
}
