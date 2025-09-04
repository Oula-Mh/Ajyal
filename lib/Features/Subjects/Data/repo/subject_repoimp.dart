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
      final subjectsList = response['data']['curriculums'];
      List<SubjectModel> subjects =
          (subjectsList as List)
              .map((curriculum) => SubjectModel.fromJson(curriculum))
              .toList();

      return Right(subjects);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubjectModel>>> getSubjectForTeacher(
    int id,
  ) async {
    try {
      var response = await api.get(EndPoints.subjectForTeacher + id.toString());
      final data = response['data'];
      final List subjectsJson = data['subjects'];

      final subjects =
          subjectsJson.map((json) => SubjectModel.fromJson(json)).toList();
      print(subjects);
      print("=====================");
      return Right(subjects);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
