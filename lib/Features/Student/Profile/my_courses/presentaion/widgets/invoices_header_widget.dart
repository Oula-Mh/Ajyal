import 'package:ajyal/Features/Advertisements/Presentation/Pages/about_insitute_page.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final double totalPaid;
  final double totalDue;
  final String selectedCourse;
  final String filterType;
  final GlobalKey filterKey;
  final VoidCallback onFilterTap;

  const HeaderWidget({
    super.key,
    required this.totalPaid,
    required this.totalDue,
    required this.selectedCourse,
    required this.filterType,
    required this.filterKey,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          //   colors: [AppColor.primaryColor, Color.fromARGB(255, 108, 120, 150)],
          colors: [
            AppColors.primaryColor,
            AppColors.gradientLight,
            AppColors.secondaryColor,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "ملخص الدفعات",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                key: filterKey,
                icon: const Icon(Icons.filter_list, color: Colors.white),
                onPressed: onFilterTap,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (filterType == "الكل" || filterType == "مدفوع")
                Expanded(
                  child: _buildSummaryCard(
                    "اجمالي المدفوع",
                    totalPaid,
                    Colors.greenAccent,
                  ),
                ),
              if (filterType == "الكل" || filterType == "غير مدفوع")
                const SizedBox(width: 10),
              if (filterType == "الكل" || filterType == "غير مدفوع")
                Expanded(
                  child: _buildSummaryCard(
                    "اجمالي المتبقي",
                    totalDue,
                    Colors.redAccent,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "الكورس المختار: $selectedCourse",
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, double amount, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount.toStringAsFixed(2),
              style: TextStyle(
                color: color,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
