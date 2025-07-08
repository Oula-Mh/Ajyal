import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';
import 'package:dartz/dartz.dart';

abstract class SubjectRepo {
  Future<Either<Failure, List<SubjectModel>>> getSubjects(int courseId);
}
