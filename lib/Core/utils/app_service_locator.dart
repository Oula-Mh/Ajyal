import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repoimp.dart';
import 'package:ajyal/Features/Community/Data/repo/community_repoimpl.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repoimp.dart';
import 'package:ajyal/Features/Parents/Home/Data/repos/home_parent_repoimp.dart';
import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repoImp.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setUpAppService() async {
  // Initialize shared preferences or cache if needed

  getit.registerLazySingleton<CacheHelper>(() => CacheHelper());
  await getit<CacheHelper>().init();

  // تسجيل TokenHandler مع تمرير CacheHelper
  getit.registerLazySingleton<TokenHandler>(
    () => TokenHandler(getit<CacheHelper>()),
  );

  getit.registerLazySingleton<Dio>(() => Dio());
  getit.registerLazySingleton<DioConsumer>(() => DioConsumer(getit.get<Dio>()));
  getit.registerLazySingleton(() => CourseRepoimp(getit.get<DioConsumer>()));
  getit.registerLazySingleton(() => AnalysisRepoimp(getit.get<DioConsumer>()));
  getit.registerLazySingleton(
    () => StudentAuthRepoimp(getit.get<DioConsumer>()),
  );
  getit.registerLazySingleton(() => SubjectRepoimp(getit.get<DioConsumer>()));
  getit.registerLazySingleton(() => CommunityRepoimp(getit.get<DioConsumer>()));
  getit.registerLazySingleton(
    () => HomeParentRepoImp(getit.get<DioConsumer>()),
  );

  getit<TokenHandler>().hasToken(TokenHandler.studentTokenKey)
      ? print(
        "${TokenHandler.studentTokenKey}== ${getit<TokenHandler>().getToken(TokenHandler.studentTokenKey)}",
      )
      : print(
        "${TokenHandler.parentTokenKey}== ${getit<TokenHandler>().getToken(TokenHandler.parentTokenKey)}",
      );

  print(getit<CacheHelper>().getData(key: "role"));
  //getit<CacheHelper>().clearData(key: "selectedCourseId");
  // CourseModel mode = getit<CacheHelper>().getData(key: "selectedCourseId");
  // print(mode);
}
