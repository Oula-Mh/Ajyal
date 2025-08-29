import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class FilterButtons extends StatelessWidget {
  final String selectedType;
  final Function(String) onChanged;
  const FilterButtons({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: FilterButton(
              label: "كتابي",
              isSelected: selectedType == "كتابي",
              onTap: () => onChanged("كتابي"),
            ),
          ),
          Expanded(
            child: FilterButton(
              label: "إلكتروني",
              isSelected: selectedType == "إلكتروني",
              onTap: () => onChanged("إلكتروني"),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: AppColor.primaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]
                  : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColor.white1 : Colors.grey,
          ),
        ),
      ),
    );
  }
}
