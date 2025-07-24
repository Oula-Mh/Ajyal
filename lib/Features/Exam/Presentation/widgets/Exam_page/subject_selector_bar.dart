import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';

class SubjectSelectorBar extends StatelessWidget {
  final List<Map<String, dynamic>> subjects;
  final int selectedIndex;
  final Function(int) onSubjectSelected;

  const SubjectSelectorBar({
    super.key,
    required this.subjects,
    required this.selectedIndex,
    required this.onSubjectSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => onSubjectSelected(index),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        isSelected
                            ? const Color.fromARGB(255, 184, 138, 168)
                            : Colors.grey.shade200,
                    radius: 30,
                    child: Icon(
                      subject["icon"],
                      color: isSelected ? Colors.white : AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subject["name"], style: const TextStyle(fontSize: 10)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
