import 'dart:ui';

import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/widgets/highlight_card_widget.dart';
import 'package:flutter/material.dart';

class Performance {
  final String text;
  final Color color;

  Performance({required this.text, required this.color});
}

Performance getPerformance(double average) {
  if (average >= 85) return Performance(text: "ممتاز", color: Colors.green);
  if (average >= 60) return Performance(text: "جيد", color: Colors.orange);
  return Performance(text: "ضعيف", color: Colors.red);
}

List<Widget> buildHighlightCards(List<SubjectMeanParentModel> subjects) {
  final excellentSubjects = subjects.where((s) => s.mean >= 85).toList();
  final goodSubjects =
      subjects.where((s) => s.mean >= 60 && s.mean < 85).toList();
  final weakSubjects = subjects.where((s) => s.mean < 60).toList();

  List<Widget> cards = [];
  if (weakSubjects.isNotEmpty) {
    cards.add(
      HighlightCardWidget(
        title: "⚠ ضعيف في",
        subjects: weakSubjects,
        color: Colors.red,
      ),
    );
  }
  if (excellentSubjects.isNotEmpty) {
    cards.add(
      HighlightCardWidget(
        title: "🏆 ممتاز في",
        subjects: excellentSubjects,
        color: Colors.green,
      ),
    );
  }
  if (cards.isEmpty && goodSubjects.isNotEmpty) {
    cards.add(
      HighlightCardWidget(
        title: "📘 يحتاج لتحسين",
        subjects: goodSubjects,
        color: Colors.orange,
      ),
    );
  }
  return cards;
}
