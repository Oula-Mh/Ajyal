import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterParentRepo {
  Future<Either<Failure, String>> register(Map data);
}
