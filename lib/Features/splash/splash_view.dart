import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Notification/Presentation/Bloc/notification/notification_cubit.dart';
import 'package:ajyal/Features/Notification/firebase_config.dart';
import 'package:ajyal/Features/splash/splash_animation_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _navigateWithTransition(BuildContext context, String route) {
    GoRouter.of(context).pushReplacement(route);
  }

  @override
  void initState() {
    super.initState();
    // استدعاء خدمة الإشعارات هنا
    print("استدعاء خدمة الإشعارات هنا");
    // FirebaseConfig.initialize(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final cubit = BlocProvider.of<NotificationCubit>(context, listen: false);
    //   FirebaseMessaging.onMessage.listen((message) {
    //     cubit.increase();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final route =
        getit<CacheHelper>().getData(key: "role") == "Parent"
            ? AppRouter.parentHome
            : AppRouter.homePage;
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
          onComplete: () {
            _navigateWithTransition(context, route);
          },
        ),
      ),
    );
  }
}
