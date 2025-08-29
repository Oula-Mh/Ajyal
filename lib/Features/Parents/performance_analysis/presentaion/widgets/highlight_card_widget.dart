import 'package:flutter/material.dart';
import '../../data/models/subject_mean_parent_model.dart';

class HighlightCardWidget extends StatelessWidget {
  final String title;
  final List<SubjectMeanParentModel> subjects;
  final Color color;

  const HighlightCardWidget({
    super.key,
    required this.title,
    required this.subjects,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  subjects
                      .map(
                        (s) => Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Row(
                            children: [
                              Text(
                                "${s.name} : ",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "${s.mean.toStringAsFixed(1)} %",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
