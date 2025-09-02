import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';

class ActionButtons extends StatelessWidget {
  final BuildContext context;
  final int courseId;

  const ActionButtons({required this.courseId, required this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StyledButton(
          text: "دفع الفواتير",
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          onPressed:
              () => GoRouter.of(
                context,
              ).push(AppRouter.unPaidInvoicesPage, extra: courseId),
        ),
        const SizedBox(width: 20),
        _StyledButton(
          text: "تفاصيل أكثر",
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _StyledButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  const _StyledButton({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
