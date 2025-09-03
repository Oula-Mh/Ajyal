import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_model.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
import 'package:ajyal/Features/Exam/data/model/exam_pre_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExamRepo {
  Future<Either<Failure, List<ExamPreModel>>> getExamPre(int id);
  Future<Either<Failure, ExamPreDetailsModel>> getExamPreDetails(int id);

  Future<Either<Failure, List<ExamCurrentModel>>> getExamCurrent(int id);
  Future<Either<Failure, ExamCurrentDetailsModel>> getExamCurrentDetails(
    int id,
  );
  Future<Either<Failure, double>> submitExam(Map data);
}
