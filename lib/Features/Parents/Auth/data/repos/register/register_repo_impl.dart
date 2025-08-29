import 'package:ajyal/Cache/cache_helper.dart';
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
      String id = (data['data']['parent']['students'][0]['id']).toString();
      await getit<TokenHandler>().saveToken(TokenHandler.parentTokenKey, token);
      await getit<CacheHelper>().saveData(key: "studentId", value: id);
      await getit<CacheHelper>().saveData(
        key: 'studentName',
        value:
            data['data']['parent']['students'][0]['first_name'] +
            " " +
            data['data']['parent']['students'][0]['last_name'],
      );
      await getit<CacheHelper>().saveData(
        key: 'studentClass',
        value: data['data']['parent']['students'][0]['class_level'],
      );
      return Right(data['message']);
    } on Exception catch (e) {
      if (e is DioException) {
        final errorMessage = e.response?.data['message'] ?? "حدث خطأ غير متوقع";
        return left(ServerFailure(errorMessage));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
