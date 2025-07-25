import 'package:flutter/material.dart';

class CourseSelectorWidget extends StatelessWidget {
  final Function(String) onCourseSelected;

  const CourseSelectorWidget({super.key, required this.onCourseSelected});

  @override
  Widget build(BuildContext context) {
    final List<String> courses = [
      "الرياضيات",
      "العلوم",
      "اللغة العربية",
      "الفيزياء",
      "الكيمياء",
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "اختر الكورس",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(courses[index]),
                  onTap: () {
                    onCourseSelected(courses[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
