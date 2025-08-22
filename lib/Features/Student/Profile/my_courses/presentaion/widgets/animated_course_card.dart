import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:flutter/material.dart';
import 'course_card.dart';

class AnimatedCourseCard extends StatefulWidget {
  final MyCoursesModel course;
  final Color backgroundColor;
  final int delay;

  const AnimatedCourseCard({
    super.key,
    required this.course,
    required this.backgroundColor,
    required this.delay,
  });

  @override
  State<AnimatedCourseCard> createState() => _AnimatedCourseCardState();
}

class _AnimatedCourseCardState extends State<AnimatedCourseCard>
    with SingleTickerProviderStateMixin {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 500),
      offset: _visible ? Offset.zero : const Offset(0, 0.2),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _visible ? 1 : 0,
        child: CourseCard(
          course: widget.course,
          backgroundColor: widget.backgroundColor,
        ),
      ),
    );
  }
}
