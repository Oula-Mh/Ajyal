// import 'package:ajyal/Cache/cache_helper.dart';
// import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
// import 'package:ajyal/Core/utils/app_service_locator.dart';
// import 'package:ajyal/Custom/Custom_widgets/custom_nav_bar.dart';
// import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo_imp.dart';
// import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_Adv/course_adv_cubit.dart';
// import 'package:ajyal/Features/Advertisements/Presentation/Bloc/general_adv/general_adv_cubit.dart';
// import 'package:ajyal/Features/Advertisements/Presentation/Pages/home_adv_page.dart';
// import 'package:ajyal/Features/Community/Presentation/Pages/community_question.dart';
// import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
// import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
// import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current/exam_current_cubit.dart';
// import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre/exam_pre_cubit.dart';
// import 'package:ajyal/Features/Exam/Presentation/Pages/exam_page.dart';
// import 'package:ajyal/Features/Exam/data/repos/exam_repoImp.dart';
// import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
// import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
// import 'package:ajyal/Features/Subjects/Presentation/Pages/subject_page.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatefulWidget {
//   final int initialIndex;

//   const HomePage({super.key, this.initialIndex = 0});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late int _currentIndex;

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex;
//   }

//   final List<Widget> _children = [
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create:
//               (context) =>
//                   CourseAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
//                     ..getCourseAdv(),
//         ),
//         BlocProvider(
//           create:
//               (context) =>
//                   GeneralAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
//                     ..getGeneralAdv(),
//         ),
//       ],
//       child: HomeAdvPage(),
//     ),

//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => CourseCubit(CourseRepoimp(DioConsumer(Dio()))),
//         ),
//         BlocProvider(
//           create: (context) => SubjectCubit(SubjectRepoimp(DioConsumer(Dio()))),
//         ),
//       ],
//       child: SubjectPage(),
//     ),

//     CommunityQuestionPage(),
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) {
//             final selectedId = getit<CacheHelper>().getData(
//               key: "selectedCourseId",
//             );
//             return SubjectCubit(SubjectRepoimp(DioConsumer(Dio())))
//               ..fetchSubjects(selectedId);
//           },
//         ),
//         BlocProvider(
//           create: (context) => CourseCubit(CourseRepoimp(DioConsumer(Dio()))),
//         ),
//         BlocProvider(
//           create: (context) => ExamPreCubit(ExamRepoimp(DioConsumer(Dio()))),
//         ),
//         BlocProvider(
//           create:
//               (context) => ExamCurrentCubit(ExamRepoimp(DioConsumer(Dio()))),
//         ),
//       ],
//       child: ExamPage(),
//     ),
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomNavigationBar(
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//       ),
//       body: _children[_currentIndex],
//     );
//   }
// }
import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_nav_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo_imp.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_Adv/course_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/general_adv/general_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/home_adv_page.dart';
import 'package:ajyal/Features/Community/Presentation/Pages/community_question.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_current/exam_current_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/exam_pre/exam_pre_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/exam_page.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repoImp.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Pages/subject_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  late bool _isVisitor;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;

    _isVisitor = !getit<TokenHandler>().hasToken(TokenHandler.studentTokenKey);
  }

  late final List<Widget> _childrenForUser = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  CourseAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                    ..getCourseAdv(),
        ),
        BlocProvider(
          create:
              (context) =>
                  GeneralAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                    ..getGeneralAdv(),
        ),
      ],
      child: HomeAdvPage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseCubit(CourseRepoimp(DioConsumer(Dio()))),
        ),
        BlocProvider(
          create:
              (context) => SubjectCubit(SubjectRepoimp(DioConsumer(Dio())))
                ..fetchSubjects(
                  getit<CacheHelper>().getData(key: "selectedCourseId"),
                ),
        ),
      ],
      child: SubjectPage(),
    ),
    CommunityQuestionPage(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final selectedId = getit<CacheHelper>().getData(
              key: "selectedCourseId",
            );
            return SubjectCubit(SubjectRepoimp(DioConsumer(Dio())))
              ..fetchSubjects(selectedId);
          },
        ),
        BlocProvider(
          create: (context) => CourseCubit(CourseRepoimp(DioConsumer(Dio()))),
        ),
        BlocProvider(
          create: (context) => ExamPreCubit(ExamRepoimp(DioConsumer(Dio()))),
        ),
        BlocProvider(
          create:
              (context) => ExamCurrentCubit(ExamRepoimp(DioConsumer(Dio()))),
        ),
      ],
      child: ExamPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (_isVisitor) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    CourseAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                      ..getCourseAdv(),
          ),
          BlocProvider(
            create:
                (context) =>
                    GeneralAdvCubit(AdvRepoImpl(DioConsumer(Dio())))
                      ..getGeneralAdv(),
          ),
        ],
        child: Scaffold(body: HomeAdvPage()),
      );
    }

    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
        currentIndex: _currentIndex,
      ),
      body: _childrenForUser[_currentIndex],
    );
  }
}
