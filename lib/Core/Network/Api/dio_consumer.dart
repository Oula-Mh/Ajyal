import 'package:ajyal/Core/Network/Api/dio_logger_interceptors.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DioConsumer implements Api {
  late Dio _dio;

  DioConsumer(Dio dio) {
    _dio = dio;
    _dio.options = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
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
        onError: (DioError error, handler) async {
          // إذا كان الرد 401 يعني التوكن منتهي الصلاحية
          if (error.response?.statusCode == 401) {
            // مسح التوكن من الـ cache
            getit<TokenHandler>().clearToken(TokenHandler.parentTokenKey);
            getit<TokenHandler>().clearToken(TokenHandler.studentTokenKey);

            // إعادة التوجيه لواجهة تسجيل الدخول
            if (navigatorKey.currentContext != null) {
              GoRouter.of(
                navigatorKey.currentContext!,
              ).pushReplacement(AppRouter.advPage);
            }
          }

          return handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(DioLoggerInterceptor());
  }

  @override
  Future<Map<String, dynamic>> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(String endPoint, dynamic data) async {
    final response = await _dio.post(endPoint, data: data);
    return response.data;
  }
}
