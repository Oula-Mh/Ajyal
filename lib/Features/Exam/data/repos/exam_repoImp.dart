import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_model.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExamRepoimp implements ExamRepo {
  final Api api;
  ExamRepoimp(this.api);

  //************************************************************************** */

  @override
  Future<Either<Failure, List<ExamPreModel>>> getExamPre(int id) async {
    try {
      final response = await api.get(EndPoints.examPre + id.toString());
      List<ExamPreModel> examPreModel = [];

      for (var item in response['data']) {
        examPreModel.add(ExamPreModel.fromJson(item));
      }

      return Right(examPreModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  //*********************************************************************** */

  @override
  Future<Either<Failure, ExamPreDetailsModel>> getExamPreDetails(int id) async {
    try {
      final response = await api.get(EndPoints.examPreDetails + id.toString());
      final ExamPreDetailsModel examPreDetailsModel =
          ExamPreDetailsModel.fromJson(response);

      return Right(examPreDetailsModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  //********************************************************************* */

  @override
  Future<Either<Failure, List<ExamCurrentModel>>> getExamCurrent(int id) async {
    try {
      final response = await api.get(EndPoints.examCurrent + id.toString());
      List<ExamCurrentModel> examCurrentModel = [];

      for (var item in response['data']) {
        examCurrentModel.add(ExamCurrentModel.fromJson(item));
      }

      return Right(examCurrentModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  //********************************************************************* */

  @override
  Future<Either<Failure, ExamCurrentDetailsModel>> getExamCurrentDetails(
    int id,
  ) async {
    try {
      final response = await api.post(
        EndPoints.examCurrentDetails + id.toString(),
        {"": ""},
      );
      final ExamCurrentDetailsModel examCurrentDetailsModel =
          ExamCurrentDetailsModel.fromJson(response);

      return Right(examCurrentDetailsModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  //******************************************************************* */

  @override
  Future<Either<Failure, double>> submitExam(Map body) async {
    try {
      final data = await api.post(EndPoints.submitExam, body);
      return Right(
        double.parse((data['data'] as num).toDouble().toStringAsFixed(2)),
      );
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  //****************************************************************** */
}
