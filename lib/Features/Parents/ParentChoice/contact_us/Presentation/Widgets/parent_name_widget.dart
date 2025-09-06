import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Bloc/contact_us/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ParentNameWidget extends StatelessWidget {
  final ContactUsState state;
  const ParentNameWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    Widget nameWidget;

    if (state is ContactUsParentSuccess) {
      final successState = state as ContactUsParentSuccess;
      nameWidget = Text(
        "مرحباً ${successState.name} ",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
        ),
      );
    } else if (state is ContactUsParentFail) {
      final failState = state as ContactUsParentFail;
      nameWidget = Text(
        failState.errMessage,
        style: const TextStyle(color: Colors.red),
      );
    } else if (state is ContactUsParentLoading) {
      // shimmer loading
      nameWidget = Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(width: 150, height: 24, color: Colors.white),
      );
    } else {
      // fallback لأي حالة أخرى
      nameWidget = const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          nameWidget,
          //const SizedBox(height: 8),
          // const Text(
          //   "نحن هنا لاستقبال ملاحظاتكم واستفساراتكم والتواصل مع إدارة المعهد سيتم الرد عليكم بأقرب وقت",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(color: AppColor.primaryColor, height: 2),
          // ),
          // const SizedBox(height: 20),
          // const Text(
          //   "* راجع قسم الإشعارات من أجل تلقي الرد",
          //   textAlign: TextAlign.start,
          //   style: TextStyle(color: AppColor.purple, height: 1),
          // ),
        ],
      ),
    );
  }
}
