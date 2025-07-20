import 'package:ajyal/Core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ajyal/Core/styles/app_color.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            splashColor: AppColor.secondaryColor,
            focusColor: AppColor.secondaryColor,
            onPressed: () {},
            icon: const Badge(
              label: Text('3', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
              child: Icon(Icons.notifications, size: 30, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.studentProfilePage);
            },
            icon: const Icon(
              Iconsax.profile_circle,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
