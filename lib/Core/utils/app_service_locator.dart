import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
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
  // await DioConsumer(dio).init();
  final token = getit<TokenHandler>().getToken();
  print("=========$token");

  // Register DioConsumer
  // getit.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));

  // // Register StudentAuthRepoimp with dependency injection
  // getit.registerSingleton<StudentAuthRepoimp>(
  //   StudentAuthRepoimp(getit<DioConsumer>()),
  // );
}
