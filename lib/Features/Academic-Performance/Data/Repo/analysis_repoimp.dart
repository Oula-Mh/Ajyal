import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/avg_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/stddev_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repo.dart';
import 'package:dartz/dartz.dart';

class AnalysisRepoimp implements AnalysisRepo {
  final Api api;

  AnalysisRepoimp(this.api);

  @override
  Future<Either<Failure, double>> getTotalMean(int courseId) async {
    try {
      final response = await api.get(EndPoints.totalmean + courseId.toString());
      final double result = (response['data']['result'] as num).toDouble();
      return Right(result.toDouble());
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }

  @override
  Future<Either<Failure, AnalysisAverageModel>> getAverageBySubject(
    int subjectId,
  ) async {
    try {
      final response = await api.get(
        EndPoints.meanForSubject + subjectId.toString(),
      );
      final avgResponse = AnalysisAverageModel.fromJson(response['data']);
      return Right(avgResponse);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }

  @override
  Future<Either<Failure, AnalysisStddevModel>> getStddevBySubject(
    int subjectId,
  ) async {
    try {
      final response = await api.get(
        EndPoints.stddevForSubject + subjectId.toString(),
      );
      final stdResoponse = AnalysisStddevModel.fromJson(response['data']);
      return Right(stdResoponse);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }

  @override
  Future<Either<Failure, AllQuizzesModel>> getQuizForAnalyis(
    int subjectId,
  ) async {
    try {
      final response = await api.get(EndPoints.quizzes + subjectId.toString());
      final quizResponse = AllQuizzesModel.fromJson(response['data']);
      return Right(quizResponse);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }
}
