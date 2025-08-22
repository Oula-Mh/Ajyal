import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Parents/Auth/data/repos/register/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterParentRepoImpl implements RegisterParentRepo {
  final Api apiService;

  RegisterParentRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> register(Map body) async {
    try {
      var data = await apiService.post(EndPoints.registerParent, body);
      String token = data['data']['token'];
      await getit<TokenHandler>().saveToken(TokenHandler.parentTokenKey, token);
      return Right(data['message']);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
