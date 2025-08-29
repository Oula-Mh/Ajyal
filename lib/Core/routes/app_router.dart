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
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current_details/exam_current_details_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre_details/exam_pre_details_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/submit_exam/submit_exam_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/exam_current_page.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/previous_exam_page.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/submit_exam_page.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repoImp.dart';
import 'package:ajyal/Features/Home/Presentation/Pages/home_page.dart';
import 'package:ajyal/Features/Home/transition_config_page.dart';
import 'package:ajyal/Features/Notification/Presentation/Bloc/notification/notification_cubit.dart';
import 'package:ajyal/Features/Notification/Presentation/Pages/parent_notification.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/login/login_cubit.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/login_view.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/qr_scanner.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/login/login_repo_imp.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/register/register_repo_impl.dart';
import 'package:ajyal/Features/Parents/Home/Data/repos/home_parent_repoimp.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/bloc/StudentLink/student_link_cubit.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/pages/parent_home.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/all_student_linked.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/link_student_scanner.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Presentation/pages/attendance_page.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Data/repo/contact_us_repoimp.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Bloc/contact_us/contact_us_cubit.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Pages/contact_us_page.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/repo/performance_analysis_repoImp.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/bloc/details_exam_parent/details_exam_parent_cubit.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/bloc/parent_combine_mean/parent_combined_mean_cubit.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/page/student_mark_analysis.dart';
import 'package:ajyal/Features/Parents/performance_analysis/presentaion/page/student_subject_details.dart';
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
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/pages/invoices.page.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/pages/my_courses_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/profile_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/student_info_page.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/presentaion/pages/payment_page.dart';
import 'package:ajyal/Features/Subjects/Data/repo/pdf_file_repimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/pdf_file/pdf_file_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/search/search_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Pages/pdf_page.dart';
import 'package:ajyal/Features/role_page.dart';
import 'package:ajyal/Features/Parents/Auth/Presentation/Pages/register_view.dart';
import 'package:ajyal/Features/splash/splash_view.dart';
import 'package:ajyal/test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class Routing {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder:
            (context, state) => BlocProvider(
              create: (context) => NotificationCubit(),
              child: const SplashView(),
            ),
      ),
      GoRoute(
        path: AppRouter.parentHome,
        builder: (context, state) => const ParentHome(),
      ),
      GoRoute(
        path: AppRouter.homePage,
        builder: (context, state) {
          final int? initialIndex = state.extra as int?;

          return HomePage(
            key: ValueKey(initialIndex),
            initialIndex: initialIndex ?? 0,
          );
        },
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
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final name = data['name'] as String;
          final passWord = data['password'] as String;
          final confirm = data['confirm'] as String;
          final number = data['number'] as String;
          return BlocProvider(
            create: (context) {
              return RegisterParentCubit(
                RegisterParentRepoImpl(DioConsumer(Dio())),
              );
            },
            child: QrScanner(
              name: name,
              number: number,
              passowrd: passWord,
              rePassword: confirm,
            ),
          );
        },
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) =>
                        ExamCurrentDetailsCubit(ExamRepoimp(DioConsumer(Dio())))
                          ..getExamCurrentDetails(id: data['id'] as int),
              ),
              BlocProvider(
                create:
                    (context) =>
                        SubmitExamCubit(ExamRepoimp(DioConsumer(Dio()))),
              ),
            ],
            child: ExamCurrentPage(
              initialTime: data['initialTime'] as int,
              totalTime: data['totalTime'] as int,
            ),
          );
        },
      ),

      GoRoute(
        path: AppRouter.submitExamPage,
        builder: (context, state) {
          final model = state.extra as ExamCurrentDetailsModel;
          return BlocProvider(
            create:
                (context) => SubmitExamCubit(ExamRepoimp(DioConsumer(Dio()))),

            child: SubmitExamPage(model: model),
          );
        },
      ),

      GoRoute(
        path: AppRouter.previousExamPage,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create:
                (context) =>
                    ExamPreDetailsCubit(ExamRepoimp(DioConsumer(Dio())))
                      ..getExamPreDetails(id: data['id'] as int),
            child: PreviousExamPage(nameExam: data['nameExam'] as String),
          );
        },
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

      GoRoute(
        path: AppRouter.attendecePage,
        builder:
            (context, state) => const AttendanceClalenderPage(
              absenceDaysPerMonth: {
                8: [2, 5, 7],
              },
            ),
      ),
      GoRoute(
        path: AppRouter.allStudentLinked,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      StudentLinkCubit(getit<HomeParentRepoImp>())
                        ..getAllParentStudent(),
              child: const AllStudentLinked(),
            ),
      ),
      GoRoute(
        path: AppRouter.linkStudentScanner,
        builder:
            (context, state) => BlocProvider(
              create: (context) => StudentLinkCubit(getit<HomeParentRepoImp>()),
              child: LinkStudentScanner(),
            ),
      ),

      // =========== pay ==============
      GoRoute(
        path: AppRouter.myCoursesPage,
        builder: (context, state) => const MyCoursesPage(),
      ),

      GoRoute(
        path: AppRouter.paymentsPage,
        builder: (context, state) => const PaymentsPage(),
      ),
      GoRoute(
        path: AppRouter.invoicesPage,
        builder: (context, state) => const InvoicesPage(),
      ),
      GoRoute(
        path: AppRouter.parentNotification,
        builder: (context, state) => const ParentNotification(),
      ),
      GoRoute(
        path: AppRouter.contactUsPage,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      ContactUsCubit(ContactUsRepoimp(DioConsumer(Dio())))
                        ..getParentName(),
              child: const ContactUsPage(),
            ),
      ),
      GoRoute(
        path: AppRouter.studentMarkAnalysis,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) => ParentCombinedMeanCubit(
                    PerformanceAnalysisRepoimp(DioConsumer(Dio())),
                  ),
              child: StudentMarkAnalysis(),
            ),
      ),

      // GoRoute(
      //   path: AppRouter.studentSubjectDetails,
      //   builder: (context, state) {
      //     final model = state.extra as List<SubjectMeanParentModel>;
      //     return StudentSubjectDetails(subjects: model);
      //   },
      // ),
      GoRoute(
        path: AppRouter.studentSubjectDetails,
        builder: (context, state) {
          final model = state.extra as List<SubjectMeanParentModel>;
          return BlocProvider(
            create:
                (context) => DetailsExamParentCubit(
                  PerformanceAnalysisRepoimp(DioConsumer(Dio())),
                ),
            child: StudentSubjectDetailsPage(subjects: model),
          );
        },
      ),
    ],
  );
}
