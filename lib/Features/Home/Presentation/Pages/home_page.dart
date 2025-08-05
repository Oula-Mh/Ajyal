import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_nav_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo_imp.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/course_Adv/course_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/general_adv/general_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/home_adv_page.dart';
import 'package:ajyal/Features/Community/Presentation/Pages/chat_page.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/exam_page.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Pages/subject_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
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
          create: (context) => SubjectCubit(SubjectRepoimp(DioConsumer(Dio()))),
        ),
      ],
      child: SubjectPage(),
    ),
    ChatPage(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final selectedId = getit<CacheHelper>().getData(
              key: "selectedCourseId",
            );
            return SubjectCubit(SubjectRepoimp(DioConsumer(Dio())))
              ..fetchSubjects(selectedId.id);
          },
        ),
        BlocProvider(
          create: (context) => CourseCubit(CourseRepoimp(DioConsumer(Dio()))),
        ),
      ],
      child: ExamPage(),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
      body: _children[_currentIndex],
    );
  }
}
