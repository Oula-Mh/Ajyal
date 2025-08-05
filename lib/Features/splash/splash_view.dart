import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Features/splash/splash_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  void _navigateWithTransition(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRouter.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white, Color(0xC8D7F1FF)],
            begin: Alignment.topCenter,
            end: Alignment.centerLeft,
          ),
        ),
        child: SplashAnimationWidget(
          onComplete: () => _navigateWithTransition(context),
        ),
      ),
    );
  }
}
