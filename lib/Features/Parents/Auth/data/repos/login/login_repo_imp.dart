import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/login/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginParentRepoImpl implements LoginParentRepo {
  final Api apiService;

  LoginParentRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> login(Map body) async {
    try {
      var data = await apiService.post(EndPoints.loginParent, body);
      String token = data['data']['token'];
      await getit<TokenHandler>().saveToken(TokenHandler.parentTokenKey, token);
      return const Right("r");
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
