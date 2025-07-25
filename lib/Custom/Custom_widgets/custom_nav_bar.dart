import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColor.primaryColor, width: 0.5),
        ),
      ),
      child: GNav(
        gap: 8,
        backgroundColor: Colors.transparent,
        color: AppColor.primaryColor,
        activeColor: Colors.white,
        tabBackgroundColor: const Color.fromRGBO(200, 220, 228, 1),
        onTabChange: onTap,
        tabBorderRadius: 30,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        selectedIndex: currentIndex,
        tabs: [
          iconBottomNavigation(Icons.home, "الرئيسية"),
          iconBottomNavigation(Icons.menu_book_rounded, "موادي"),
          iconBottomNavigation(Icons.assignment_outlined, "اختبارت"),
          iconBottomNavigation(Icons.chat_outlined, "تواصل"),
        ],
      ),
    );
  }
}

GButton iconBottomNavigation(IconData icon, String text) {
  return GButton(
    icon: icon,
    text: text,
    iconSize: 27,
    iconActiveColor: AppColor.primaryColor,
    textColor: AppColor.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  );
}
