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

    if (state is ContactUsSuccess) {
      final successState = state as ContactUsSuccess;
      nameWidget = Text(
        "مرحباً ${successState.name} ",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
        ),
      );
    } else if (state is ContactUsFail) {
      final failState = state as ContactUsFail;
      nameWidget = Text(
        failState.errMessage,
        style: const TextStyle(color: Colors.red),
      );
    } else {
      // shimmer loading
      nameWidget = Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(width: 150, height: 24, color: Colors.white),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          nameWidget,
          const SizedBox(height: 8),
          const Text(
            "نحن هنا لاستقبال ملاحظاتكم واستفساراتكم والتواصل مع إدارة المعهد سيتم الرد عليكم بأقرب وقت",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.primaryColor, height: 2),
          ),
          SizedBox(height: 20),
          const Text(
            "* راجع قسم الإشعارات من أجل تلقي الرد",
            textAlign: TextAlign.start,
            style: TextStyle(color: AppColor.purple, height: 1),
          ),
        ],
      ),
    );
  }
}
