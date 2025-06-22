import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:dartz/dartz.dart';

abstract class LoginParentRepo {
  Future<Either<Failure, String>> login(Map data);
}
