import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/avg_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Model/stddev_model.dart';
import 'package:dartz/dartz.dart';

abstract class AnalysisRepo {
  Future<Either<Failure, double>> getTotalMean(int courseId);
  Future<Either<Failure, AnalysisAverageModel>> getAverageBySubject(
    int subjectId,
  );
  Future<Either<Failure, AnalysisStddevModel>> getStddevBySubject(
    int subjectId,
  );
  Future<Either<Failure, AllQuizzesModel>> getQuizForAnalyis(int subjectId);
}
