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
          BottomNavigationBarItem(
            icon: IconBottomNavigation(Iconsax.profile_2user),
          ),
          BottomNavigationBarItem(icon: IconBottomNavigation(Iconsax.home)),
          BottomNavigationBarItem(icon: IconBottomNavigation(Iconsax.book)),
        ],
      ),
    );
  }
}

Widget IconBottomNavigation(IconData iconData) {
  return Icon(iconData, size: 26);
}
