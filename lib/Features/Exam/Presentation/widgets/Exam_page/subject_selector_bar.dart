import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';
import 'package:flutter/material.dart';

class SubjectSelectorBar extends StatelessWidget {
  final List<SubjectModel> subjects;
  final int selectedIndex;
  final Function(int) onSubjectSelected;

  const SubjectSelectorBar({
    super.key,
    required this.subjects,
    required this.selectedIndex,
    required this.onSubjectSelected,
  });

  final Map<String, IconData> subjectIcons = const {
    "رياضيات": Icons.calculate,
    "فيزياء": Icons.science,
    "كيمياء": Icons.bubble_chart,
    "علوم": Icons.biotech,
    "عربي": Icons.menu_book,
    "إنكليزي": Icons.language,
    "فلسفة": Icons.psychology,
    "ديانة": Icons.mosque,
    "تاريخ": Icons.history_edu,
    "جغرافيا": Icons.public,
  };

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

          // اختر الأيقونة حسب اسم المادة
          final icon = subjectIcons[subject.name ?? ""] ?? Icons.book;

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
                      icon,
                      color: isSelected ? Colors.white : AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subject.name ?? "",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
