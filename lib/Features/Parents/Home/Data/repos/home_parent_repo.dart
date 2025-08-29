import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Parents/Home/Data/models/parent_student_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeParentRepo {
  Future<Either<Failure, String>> linkStudent(Map body);
  Future<Either<Failure, List<ParentStudentModel>>> getAllParentStudent();
}
