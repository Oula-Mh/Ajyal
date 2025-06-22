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
      receiveDataWhenStatusError: true,
      headers: {'Content-Type': 'application/json'},
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = getit<TokenHandler>().getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
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
