import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/details_exam_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/repo/performance_analysis_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PerformanceAnalysisRepoimp implements PerformanceAnalysisRepo {
  final Api api;
  PerformanceAnalysisRepoimp(this.api);

  @override
  Future<Either<Failure, List<SubjectMeanParentModel>>> getSubjectMeanParent(
    int idStudent,
    int idCourse,
  ) async {
    try {
      final response = await api.get(
        EndPoints.studentAnalysis +
            idStudent.toString() +
            EndPoints.subjectMean +
            idCourse.toString(),
      );
      List<SubjectMeanParentModel> subjectMeanParentModel = [];

      for (var item in response['data']) {
        subjectMeanParentModel.add(SubjectMeanParentModel.fromJson(item));
      }

      return Right(subjectMeanParentModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, double>> getTotalMeanParent(
    int idStudent,
    int idCourse,
  ) async {
    try {
      final response = await api.get(
        EndPoints.studentAnalysis +
            idStudent.toString() +
            EndPoints.totalMeanParent +
            idCourse.toString(),
      );
      final result = (response['data']['result'] as num).toDouble();
      return Right(result.toDouble());
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }

  @override
  Future<Either<Failure, ExamDetailsParentModel>> getMarks(
    int idStudent,
    int idSubject,
  ) async {
    try {
      final response = await api.get(
        EndPoints.studentAnalysis +
            idStudent.toString() +
            EndPoints.subjectMarks +
            idSubject.toString(),
      );

      final ExamDetailsParentModel examDetailsParentModel =
          ExamDetailsParentModel.fromJson(response['data']);

      return Right(examDetailsParentModel);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
