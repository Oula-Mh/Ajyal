import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Notification/Presentation/Widget/notification_bell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.parentNotification);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: NotificationIcon(isStudent: true),
            ),
          ),
          getit<TokenHandler>().hasToken(TokenHandler.studentTokenKey)
              ? IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.studentProfilePage);
                },
                icon: const Icon(
                  Iconsax.profile_circle,
                  size: 30,
                  color: Colors.white,
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}
