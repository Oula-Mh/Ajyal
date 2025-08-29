import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/details_exam_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:dartz/dartz.dart';

abstract class PerformanceAnalysisRepo {
  Future<Either<Failure, List<SubjectMeanParentModel>>> getSubjectMeanParent(
    int idStudent,
    int idCourse,
  );

  Future<Either<Failure, double>> getTotalMeanParent(
    int idStudent,
    int idCourse,
  );

  Future<Either<Failure, ExamDetailsParentModel>> getMarks(
    int idStudent,
    int idSubject,
  );
}
