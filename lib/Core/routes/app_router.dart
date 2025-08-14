import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repoimp.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/AllQuizzesCubit/all_quizz_cubit_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentAllMean/student_all_mean_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Bloc/StudentAllStddev/student_all_stddev_cubit.dart';
import 'package:ajyal/Features/Academic-Performance/Presentation/Pages/analysis_perf_page.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/model/course_adv_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo_imp.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_adv/course_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/general_adv/general_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/teacher_adv/teacher_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/about_insitute_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/all_generaladv_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/all_teacheradv_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/home_adv_page.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/teacher_adv_page.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Course/Presentation/Pages/course_details.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/exam_current_page.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/previous_exam_page.dart';
import 'package:ajyal/Features/Home/Presentation/Pages/home_page.dart';
import 'package:ajyal/Features/Home/transition_config_page.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/login_view.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/qr_scanner.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/login/login_repo_imp.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/register/register_repo_impl.dart';
import 'package:ajyal/Features/Payment/Data/repo/payment_repoimp.dart';
import 'package:ajyal/Features/Payment/view/bloc/cubit/stripe_link_cubit.dart';
import 'package:ajyal/Features/Payment/view/payment.dart';
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
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/register_view.dart';
import 'package:ajyal/Features/splash/splash_view.dart';
import 'package:ajyal/test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class Routing {
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashView()),
      GoRoute(
        path: AppRouter.homePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: "/pay",
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      StripeLinkCubit(PaymentRepoimp(DioConsumer(Dio())))
                        ..payment(),
              // ..payment(),
              child: const Payment(),
            ),
      ),
      GoRoute(
        path: AppRouter.advPage,
        builder: (context, state) => const HomeAdvPage(),
      ),
      GoRoute(
        path: AppRouter.rolePage,
        builder: (context, state) => const RolePage(),
      ),
      GoRoute(
        path: AppRouter.configPage,
        builder: (context, state) => const TransitionConfigPage(),
      ),
      GoRoute(
        path: AppRouter.courseDetailsPage,
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
        path: AppRouter.studentProfilePage,
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
        path: AppRouter.teacherInfoPage,
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
        path: AppRouter.test,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final List<AdvModel> resultsList = args['resultsList'];
          final AdvPaginationModel paginationModel = args['paginationModel'];
          return BlocProvider(
            create:
                (context) =>
                    CourseAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                      ..getCourseAdv(),
            child: TestPage(
              resultsList: resultsList,
              paginationModel: paginationModel,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRouter.allTeacherPage,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final List<AdvModel> resultsList = args['resultsList'];
          return AllTeacherPage(resultsList: resultsList);
        },
      ),
      GoRoute(
        path: AppRouter.allGeneralPage,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final List<AdvModel> resultsList = args['resultsList'];
          final AdvPaginationModel paginationModel = args['paginationModel'];
          return BlocProvider(
            create:
                (context) =>
                    GeneralAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                      ..getGeneralAdv(),
            child: AllGeneraladvPage(
              resultsList: resultsList,
              paginationModel: paginationModel,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRouter.pdfPage,
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
        path: AppRouter.qrScannerPage,
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
        path: AppRouter.parentLogin,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      LoginParentCubit(LoginParentRepoImpl(DioConsumer(Dio()))),
              child: const LoginView(),
            ),
      ),

      GoRoute(
        path: AppRouter.parentRgister,
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
        path: AppRouter.checkStudentPage,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      RegisterCubit(StudentAuthRepoimp(DioConsumer(Dio()))),
              child: const CheckStudentPage(),
            ),
      ),
      GoRoute(
        path: AppRouter.completeRegisterPage,
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
        path: AppRouter.aboutInstitutePage,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) =>
                        TeacherAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                          ..getTeacherAdv(),
              ),
              //BlocProvider(create: (context) => SubjectBloc()),
            ],
            child: AboutInstitutePage(),
          );
        },
      ),
      GoRoute(
        path: AppRouter.studentPersonalInfo,
        builder: (context, state) {
          final model = state.extra as StudentProfileModel;
          return StudentInfoPage(model: model);
        },
      ),
      GoRoute(
        path: AppRouter.loginPage,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      LoginCubit(StudentAuthRepoimp(DioConsumer(Dio()))),
              child: const LoginPage(),
            ),
      ),

      GoRoute(
        path: AppRouter.teacherInfoPage,
        builder: (context, state) => const TeacherInfoPage(),
      ),

      //*******************exam************************** */
      GoRoute(
        path: AppRouter.examCurrentPage,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ExamCurrentPage(
            initialTime: data['initialTime'] as int,
            totalTime: data['totalTime'] as int,
          );
        },
      ),

      GoRoute(
        path: AppRouter.previousExamPage,
        builder: (context, state) => PreviousExamPage(),
      ),

      //======= Analayse Performence ========
      GoRoute(
        //path: "/",
        path: AppRouter.analaysPerfPage,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create:
                      (context) =>
                          StudentAllMeanCubit(getit<AnalysisRepoimp>()),
                ),
                BlocProvider(
                  create:
                      (context) =>
                          StudentAllStddevCubit(getit<AnalysisRepoimp>()),
                ),
                BlocProvider(
                  create:
                      (context) => AllQuizzCubitCubit(getit<AnalysisRepoimp>()),
                ),
              ],
              child: AnalysPerfPage(),
            ),
      ),
    ],
  );
}
