import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:dartz/dartz.dart';

abstract class StudentLinkRepo {
  Future<Either<Failure, String>> linkStudent(Map body);
}
