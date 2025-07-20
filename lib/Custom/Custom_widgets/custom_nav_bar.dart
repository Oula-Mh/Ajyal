import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavigationBar extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;

  const CustomNavigationBar({
    required this.onTap,
    required this.currentIndex,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        border: const Border(top: BorderSide(width: 0.01)),
      ),
      child: SnakeNavigationBar.color(
        backgroundColor: AppColor.white1,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.circle,
        padding: const EdgeInsets.symmetric(vertical: 3),
        snakeViewColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.primaryColor,
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          // BottomNavigationBarItem(
          //   icon: iconBottomNavigation(Iconsax.profile_2user, "ملفي"),
          // ),
          BottomNavigationBarItem(
            icon: iconBottomNavigation(Iconsax.home, "الرئيسية"),
          ),
          BottomNavigationBarItem(
            icon: iconBottomNavigation(Iconsax.book_1, "موادي"),
          ),
          BottomNavigationBarItem(
            icon: iconBottomNavigation(Icons.chat_outlined, "تواصل"),
          ),
          BottomNavigationBarItem(
            icon: iconBottomNavigation(Icons.assignment_outlined, "اختبارات"),
          ),
        ],
      ),
    );
  }
}

Widget iconBottomNavigation(IconData iconData, String text) {
  return Column(
    children: [
      Icon(iconData, size: 24),
      Text(text, style: TextStyle(fontSize: 12)),
    ],
  );
}
