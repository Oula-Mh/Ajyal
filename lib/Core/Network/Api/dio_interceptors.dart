import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = getit<TokenHandler>().getToken();
    options.headers["token"] = token != null ? "$token" : null;
    options.headers["Accept"] = "application/json";
  }
}
