import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Parents/Home/Data/repos/student_link_repo.dart';
import 'package:dartz/dartz.dart';

class StudentLinkRepoImp implements StudentLinkRepo {
  final Api api;

  StudentLinkRepoImp(this.api);

  @override
  Future<Either<Failure, String>> linkStudent(Map body) async {
    try {
      var data = await api.post(EndPoints.linkStudent, body);
      String message = data['message'];
      return Right(message);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }
}
