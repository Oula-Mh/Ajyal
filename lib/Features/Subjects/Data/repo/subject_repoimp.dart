import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SubjectRepoimp implements SubjectRepo {
  final Api api;
  SubjectRepoimp(this.api);

  @override
  Future<Either<Failure, List<SubjectModel>>> getSubjects(int courseId) async {
    try {
      final response = await api.get(
        EndPoints.courseSubjects + courseId.toString(),
      );
      final subjects = response['data']['subjects'];
      final List<SubjectModel> subjectList =
          (subjects as List)
              .map((json) => SubjectModel.fromJson(json))
              .toList();
      return Right(subjectList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
