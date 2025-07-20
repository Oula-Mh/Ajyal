import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo_imp.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_adv/course_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/all_generaladv_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/home_adv_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/teacher_adv_page.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Pages/all_course_page.dart';
import 'package:ajyal/Features/Course/Presentation/Pages/course_details.dart';
import 'package:ajyal/Features/Home/Presentation/Pages/home_page.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/login_view.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/qr_scanner.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/login/login_repo_imp.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/register/register_repo_impl.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repoImp.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/check_student_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/complete_register_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/login_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/profile_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/student_info_page.dart';
import 'package:ajyal/Features/Subjects/Data/repo/pdf_file_repimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/pdf_file/pdf_file_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/search/search_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Pages/pdf_page.dart';
import 'package:ajyal/Features/role_page.dart';
import 'package:ajyal/Features/splash/splash_view.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/register_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homePage = '/homePage';
  //static const registerPage = '/registerPage';
  static const loginPage = '/loginPage';
  static const checkStudentPage = '/checkStudentPage';
  static const completeRegisterPage = '/completeRegisterPage';
  static const advPage = '/AdvertisementsPage';
  static const rolePage = '/rolePage';
  static const parentRgister = "/parent_register";
  static const parentLogin = "/parent_login";
  static const qrScannerPage = "/qrScannerPage";
  static const studentPersonalInfo = "/studentPersonalInfo";
  static const pdfPage = "/pdfPage";
  static const allCoursePage = "/allCoursePage";
  static const allGeneralPage = "/allGeneralPage";
  static const courseDetailsPage = "/courseDetailsPage";
  static const teacherInfoPage = "/teacherInfoPage";
  static const studentProfilePage = "/studentProfilePage";

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(path: "/", builder: (context, state) => const SplashView()),
      GoRoute(path: homePage, builder: (context, state) => const HomePage()),
      GoRoute(path: advPage, builder: (context, state) => const HomeAdvPage()),
      GoRoute(path: rolePage, builder: (context, state) => const RolePage()),
      GoRoute(
        path: courseDetailsPage,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final courseId = data['id'];
          final images = data['images'];
          return BlocProvider(
            create:
                (context) =>
                    CourseCubit(CourseRepoimp(DioConsumer(Dio())))
                      ..getCourseDetails(courseId),
            child: CourseDetailsPage(images: images),
          );
        },
      ),
      GoRoute(
        path: studentProfilePage,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) =>
                    ProfileCubit(StudentAuthRepoimp(DioConsumer(Dio())))
                      ..getStudentProfile(),
            child: ProfilePage(),
          );
        },
      ),
      GoRoute(
        path: teacherInfoPage,
        builder: (context, state) {
          var teacherId = state.extra as int;
          return BlocProvider(
            create:
                (context) =>
                    ProfileCubit(StudentAuthRepoimp(DioConsumer(Dio())))
                      ..getTeacherProfile(teacherId),
            child: TeacherInfoPage(),
          );
        },
      ),
      GoRoute(
        path: allCoursePage,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final List<CourseAdvModel> resultsList = args['resultsList'];
          final AdvPaginationModel paginationModel = args['paginationModel'];
          return AllCoursePage(
            resultsList: resultsList,
            paginationModel: paginationModel,
          );
        },
      ),
      GoRoute(
        path: allGeneralPage,
        builder: (context, state) {
          return AllGeneraladvPage();
        },
      ),
      GoRoute(
        path: pdfPage,
        builder: (context, state) {
          final curriculaId = state.extra as int;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) =>
                        PdfFileCubit(PdfFileRepoImpl(DioConsumer(Dio())))
                          ..getSubjectPdfFile(curriculaId),
              ),
              BlocProvider(create: (context) => SearchCubit([])),
            ],
            child: PdfPage(curriculaId: curriculaId),
          );
        },
      ),
      GoRoute(
        path: qrScannerPage,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => RegisterParentCubit(
                    RegisterParentRepoImpl(DioConsumer(Dio())),
                  ),
              child: const QrScanner(),
            ),
      ),

      GoRoute(
        path: parentLogin,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      LoginParentCubit(LoginParentRepoImpl(DioConsumer(Dio()))),
              child: const LoginView(),
            ),
      ),

      GoRoute(
        path: parentRgister,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => RegisterParentCubit(
                    RegisterParentRepoImpl(DioConsumer(Dio())),
                  ),
              child: const RegisterView(),
            ),
      ),
      // GoRoute(
      //   path: registerPage,
      //   builder:
      //       (context, state) => BlocProvider(
      //         create:
      //             (context) =>
      //                 RegisterCubit(StudentAuthRepoimp(DioConsumer(Dio()))),
      //         child: const RegisterPage(),
      //       ),
      // ),
      GoRoute(
        path: checkStudentPage,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      RegisterCubit(StudentAuthRepoimp(DioConsumer(Dio()))),
              child: const CheckStudentPage(),
            ),
      ),
      GoRoute(
        path: completeRegisterPage,
        builder: (context, state) {
          final model = state.extra as CheckStudentInfoModel;
          return BlocProvider(
            create:
                (context) =>
                    RegisterCubit(StudentAuthRepoimp(DioConsumer(Dio()))),
            child: CompleteRegisterPage(model: model),
          );
        },
      ),
      GoRoute(
        path: studentPersonalInfo,
        builder: (context, state) {
          final model = state.extra as StudentProfileModel;
          return StudentInfoPage(model: model);
        },
      ),
      GoRoute(
        path: loginPage,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      LoginCubit(StudentAuthRepoimp(DioConsumer(Dio()))),
              child: const LoginPage(),
            ),
      ),
    ],
  );
}
