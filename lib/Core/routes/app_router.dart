import 'package:ajyal/Features/Home/Presentation/Pages/home_page.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/login_view.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/qr_scanner.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/login_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/register_page.dart';
import 'package:ajyal/Features/role_page.dart';
import 'package:ajyal/Features/splash/splash_view.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/register_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homePage = '/homePage';
  static const registerPage = '/registerPage';
  static const loginPage = '/loginPage';
  static const advPage = '/AdvertisementsPage';
  static const rolePage = '/rolePage';
  static const parentRgister = "/parent_register";
  static const parentLogin = "/parent_login";
  static const qrScannerPage = "/qrScannerPage";

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(path: "/", builder: (context, state) => const SplashView()),
      GoRoute(path: homePage, builder: (context, state) => const HomePage()),
      GoRoute(path: advPage, builder: (context, state) => const AdPage()),
      GoRoute(path: rolePage, builder: (context, state) => const RolePage()),
      GoRoute(path: qrScannerPage, builder: (context, state) => QrScanner()),
      GoRoute(
        path: parentLogin,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: parentRgister,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: registerPage,
        builder:
            (context, state) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: const RegisterPage(),
            ),
      ),
      GoRoute(
        path: loginPage,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginPage(),
            ),
      ),
    ],
  );
}
