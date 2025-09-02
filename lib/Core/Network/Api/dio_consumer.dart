import 'package:ajyal/Core/Network/Api/dio_logger_interceptors.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:dio/dio.dart';

class DioConsumer implements Api {
  late Dio _dio;

  DioConsumer(Dio dio) {
    _dio = dio;
    _dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30), // 👈 not zero
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token =
              getit<TokenHandler>().hasToken(TokenHandler.parentTokenKey)
                  ? getit<TokenHandler>().getToken(TokenHandler.parentTokenKey)
                  : getit<TokenHandler>().getToken(
                    TokenHandler.studentTokenKey,
                  );
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    _dio.interceptors.add(DioLoggerInterceptor());
  }

  @override
  Future<Map<String, dynamic>> get(String endPoint) async {
    //   try {
    final response = await _dio.get(endPoint);
    return response.data;
    // } on DioException catch (error) {
    //   //throw ServerFailure.fromDioError(error);
    // } catch (error, stackTrace) {
    //   // log to crashlytics or console
    //   print("Error: $error\nStackTrace: $stackTrace");
    //   // throw ServerFailure("Unexpected error: $error");
    // }
  }

  @override
  Future<Map<String, dynamic>> post(String endPoint, Map data) async {
    //  try {
    final response = await _dio.post(endPoint, data: data);
    return response.data;
    // }
    //  on DioException catch (e) {
    //   handleDioExceptions(e);
    //   //throw ServerFailure.fromDioError(error);
    // } catch (error, stackTrace) {
    //   print("Error: $error\nStackTrace: $stackTrace");
    // }
  }
}
