import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_nav_bar.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo_imp.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/adv/adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Pages/home_adv_page.dart';
import 'package:ajyal/Features/Community/Presentation/Pages/chat_page.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Course/Presentation/Bloc/course/course_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/Pages/exam_page.dart';
import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repoImp.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Pages/profile_page.dart';
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
  int _currentIndex = 1;
  final List<Widget> _children = [
    BlocProvider(
      create:
          (context) =>
              ProfileCubit(StudentAuthRepoimp(DioConsumer(Dio())))
                ..getProfile(),
      child: ProfilePage(),
    ),
    BlocProvider(
      create:
          (context) =>
              AdvCubit(AdvRepoImpl(DioConsumer(Dio())))..getCourseAdv(),
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
    ExamPage(),
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
