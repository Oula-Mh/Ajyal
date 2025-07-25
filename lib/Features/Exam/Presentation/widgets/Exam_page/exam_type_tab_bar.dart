import 'package:flutter/material.dart';

class ExamTypeTabBar extends StatelessWidget {
  final int selectedTabIndex;
  final Function(int) onTabSelected;

  const ExamTypeTabBar({
    super.key,
    required this.selectedTabIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: const Color.fromARGB(255, 249, 247, 247),
      child: Row(
        children: [
          _buildTab("الاختبارات السابقة", 0),
          _buildTab("الاختبارات الحالية", 1),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color:
                selectedTabIndex == index
                    ? const Color.fromARGB(255, 250, 227, 191)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedTabIndex == index ? Colors.orange : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
