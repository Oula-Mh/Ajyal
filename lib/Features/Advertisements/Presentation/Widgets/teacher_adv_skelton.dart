import 'package:flutter/material.dart';

class TeacherAdvListSkeleton extends StatelessWidget {
  const TeacherAdvListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3, // عدد العناصر المؤقتة
      itemBuilder: (context, index) {
        return Container(
          width: 135,
          margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF2F4170).withOpacity(0.2), // لون الهيكل
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F4170).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Container(
                    width: 60,
                    height: 12,
                    color: Colors.white.withOpacity(0.5), // مكان النص الوهمي
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
