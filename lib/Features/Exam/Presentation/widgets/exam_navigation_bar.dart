import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import '../widgets/arrow_next_pre.dart';

class ExamNavigationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final VoidCallback onOpenGrid;

  const ExamNavigationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrevious,
    required this.onOpenGrid,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArrowNextPre(
            onTap: onPrevious,
            color:
                currentPage > 0
                    ? AppColor.primaryColor
                    : const Color(0xFFCDCCCC),
            icon: Icons.arrow_back_ios,
          ),
          GestureDetector(
            onTap: onOpenGrid,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              decoration: BoxDecoration(
                color: AppColor.white1,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: AppColor.primaryColor),
              ),
              child: Text(
                "السؤال ${currentPage + 1} من $totalPages",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ArrowNextPre(
            onTap: onNext,
            color:
                currentPage < totalPages - 1
                    ? AppColor.primaryColor
                    : const Color(0xFFCDCCCC),
            icon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
