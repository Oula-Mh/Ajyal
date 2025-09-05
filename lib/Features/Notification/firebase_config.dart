import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/about_insitute_page.dart';
import 'package:ajyal/Features/Notification/Presentation/local_noti_service.dart';
import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:ajyal/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/// -------------------------
/// Background Handler
/// -------------------------
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(' لديك إشعار جديد: ${message.notification!.body!}');

  // await Firebase.initializeApp();
  // final prefs = await SharedPreferences.getInstance();
  final prefs = await SharedPreferences.getInstance();
  int currentCount = prefs.getInt("notiCount") ?? 0;
  await prefs.setInt("notiCount", currentCount + 1);
  // لا تلمس notiCountNotifier هنا (خارج الـ isolate)
}

/// -------------------------
/// Firebase Service Class
/// -------------------------
class FirebaseService {
  static Future<void> init() async {
    final FirebaseMessaging _messaging = FirebaseMessaging.instance;
    final token = await _messaging.getToken();
    print("FCM Token: $token");
    getit<CacheHelper>().saveData(key: "fcm", value: token);
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // //  await FirebaseConfig().initNotifications();
    // await FirebaseService.init();

    // عند استقبال إشعار أثناء فتح التطبيق
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // final prefs = await SharedPreferences.getInstance();
      // int currentCount = prefs.getInt("notiCount") ?? 0;
      // await prefs.setInt("notiCount", currentCount + 1);
      await incrementNotiCountInPrefs();
      print(
        '==================\n Received a foreground message: ${message.notification?.title}',
      );
      final notification = message.notification;
      if (notification != null) {
        final overlay = navigatorKey.currentState?.overlay;
        if (overlay != null) {
          showTopSnackBar(
            navigatorKey.currentState!.overlay!,
            CustomSnackBar.success(
              message: "لديك إشعار جديد ! \n ${notification.body}",
              textAlign: TextAlign.right,
              backgroundColor: Colors.grey.shade400, // لون الخلفية
              textStyle: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              icon: Padding(
                padding: const EdgeInsets.only(left: 40, bottom: 15),
                child: const Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          );
        }
      }
    });

    // Background handler موجود عندك ومكمل
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  static Future<void> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  // static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();

  // /// Call this early in main()
  // static Future<void> init() async {
  //   WidgetsFlutterBinding.ensureInitialized();

  //   // Request permissions (iOS & Android 13+)
  //   await _messaging.requestPermission(alert: true, badge: true, sound: true);
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyDLp52E7-yzXST6OHAYT5dWF1Gjfl2ZP1M",
  //       appId: '1:707645520656:android:3bfce7c9c26c891ad58395',
  //       messagingSenderId: '707645520656',
  //       projectId: 'test-49b2e',
  //       storageBucket: 'test-49b2e.appspot.com',
  //     ),
  //   );

  //   // Get FCM token
  //   final token = await _messaging.getToken();
  //   print("FCM Token: $token");

  //   // Register background handler
  //   FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  // }

  // /// Call this in main widget
  // static void setupHandlers() {
  //   // App opened from background / notification click
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print("App opened from notification click");
  //     navigatorKey.currentState?.pushNamed(AppRouter.parentNotification);
  //   });

  //   // App launched from terminated state via notification
  //   _messaging.getInitialMessage().then((message) {
  //     if (message != null) {
  //       print("App launched from notification");
  //       navigatorKey.currentState?.pushNamed(AppRouter.parentNotification);
  //     }
  //   });

  //   // Foreground messages (ignored system notification, نطبع data فقط)
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print("pwgj حصلت على اشعاااار");
  //   });
  // }
}
