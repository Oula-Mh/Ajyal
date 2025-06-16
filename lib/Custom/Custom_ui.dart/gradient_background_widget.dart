import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class GradientBackgroundWidget extends StatelessWidget {
  final Widget child;

  const GradientBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF17284B), Color(0xFF17284B), Color(0xFF365EB1)],
              stops: [0.0, 0.75, 1.0],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),

        Positioned.fill(
          child: Image.asset(AppImages.backgroundCircule, fit: BoxFit.cover),
        ),
        child,
      ],
    );
  }
}
