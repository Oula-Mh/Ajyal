import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Notification/Presentation/Bloc/notification/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentNotification extends StatelessWidget {
  const ParentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "الإشعارات"),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NotificationFailure) {
            return Center(child: Text(state.message));
          } else if (state is NotificationSuccess) {
            final notifications = state.notifications;

            if (notifications.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.notifications_off, size: 60, color: Colors.grey),
                    SizedBox(height: 12),
                    Text(
                      "لا يوجد إشعارات",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final n = notifications[index];

                final Color containerColor =
                    index.isEven
                        ? AppColor.secondaryColor.withAlpha(110)
                        : const Color.fromARGB(255, 225, 243, 205);

                return Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              n.type, // النوع (Invoice, Payment, ...)
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (n.createdAt != null)
                            Text(
                              timeAgo(n.createdAt!),
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        n.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        n.body,
                        style: const TextStyle(fontSize: 14, height: 1.8),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
