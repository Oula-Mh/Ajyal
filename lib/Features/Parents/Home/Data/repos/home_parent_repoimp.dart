import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Parents/Home/Data/models/parent_student_model.dart';
import 'package:ajyal/Features/Parents/Home/Data/repos/home_parent_repo.dart';
import 'package:dartz/dartz.dart';

class HomeParentRepoImp implements HomeParentRepo {
  final Api api;

  HomeParentRepoImp(this.api);

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

  @override
  Future<Either<Failure, List<ParentStudentModel>>>
  getAllParentStudent() async {
    try {
      var data = await api.get(EndPoints.allParentStudent);
      List<dynamic> studentsJson = data['data'];
      return right(
        studentsJson.map((json) => ParentStudentModel.fromJson(json)).toList(),
      );
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }
}
