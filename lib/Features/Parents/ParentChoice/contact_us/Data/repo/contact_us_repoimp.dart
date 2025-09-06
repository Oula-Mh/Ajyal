import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Data/repo/contact_us_repo.dart';
import 'package:dartz/dartz.dart';

class ContactUsRepoimp implements ContactUsRepo {
  final Api api;

  ContactUsRepoimp(this.api);
  @override
  @override
  Future<Either<Failure, String>> getParentInfo() async {
    try {
      var data = await api.get(EndPoints.parentProfile);
      String parentName = data['role_data']['name'];
      return right(parentName);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }

  @override
  Future<Either<Failure, String>> sendMessage(Map body) async {
    try {
      var data = await api.post(EndPoints.addComplaint, body);
      String message = data['message'];
      return Right(message);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }
}
